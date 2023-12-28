const { Kafka, Partitioners } = require('kafkajs')
const { handleOrderState } = require('./services')

const kafka = new Kafka({
  clientId: 'order-app',
  brokers: ['kafka:19092'],
  retry: {
    initialRetryTime: 2000,
    retries: 5
  }
})

const producer = kafka.producer({
    allowAutoTopicCreation: true,
    createPartitioner: Partitioners.LegacyPartitioner
})

const sendOrders = async (msg)=>{
 await producer.connect()
 await producer.send({
    topic: 'ordersProducer',
    messages: [{
        value: JSON.stringify(msg)
    }]
 })

 await producer.disconnect()
}


const consumer = kafka.consumer({
  groupId: "orders_group",
  allowAutoTopicCreation: true,
})
const fetchOrderState = async()=>{
  try {
    await consumer.connect()
    await consumer.subscribe({topics:["productsProducer"]})

    await consumer.run({
      eachMessage: async({message}) => {
        const jsonMsg = JSON.parse(message.value)
        //console.log(jsonMsg)
        const resuly = await handleOrderState(jsonMsg)
      }
    })
  } catch (error) {
    await consumer.disconnect()
    console.log(error.message)
    
  }
}

setTimeout(async()=>{
  try {
    await fetchOrderState()
  } catch (error) {
    console.log(error.message)
  }

},30000)

module.exports = {
    kafkaProducer: sendOrders
}
