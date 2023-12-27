const { Kafka, Partitioners } = require('kafkajs')

const kafka = new Kafka({
  clientId: 'products-app',
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
    topic: 'productsProducer',
    messages: [{
        value: JSON.stringify(msg)
    }]
 })

 await producer.disconnect()
}

const consumer = kafka.consumer({
    groupId: "products_group",
    allowAutoTopicCreation: true,
})

const fetchProductsFromOrderTopic = async()=>{
  try {
    await consumer.connect()
    await consumer.subscribe({topics:["ordersProducer"]})

    await consumer.run({
      eachMessage: async({message}) => {
        const jsonMsg = JSON.parse(message)
        console.log(jsonMsg)
      }
    })
  } catch (error) {
    await consumer.disconnect()
    console.log(error.message)
    
  }
}

setTimeout(async()=>{
  try {
    await fetchProductsFromOrderTopic()
  } catch (error) {
    console.log(error.message)
  }

},30000)
