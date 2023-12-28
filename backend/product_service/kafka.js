const { Kafka, Partitioners } = require('kafkajs')
const { handleProducts } = require('./services')

const kafka = new Kafka({//initiate kafka connection
  clientId: 'products-app',
  brokers: ['kafka:19092'],//door kafka listens ti inside docker container
  retry: {
    initialRetryTime: 2000,
    retries: 5
  }
})

const producer = kafka.producer({//create producer
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

const consumer = kafka.consumer({//create consumer to order info
    groupId: "products_group",
    allowAutoTopicCreation: true,
})

const fetchProductsFromOrderTopic = async()=>{
  try {
    await consumer.connect()
    await consumer.subscribe({topics:["ordersProducer"]})

    await consumer.run({
      eachMessage: async({message}) => {
        const jsonMsg = JSON.parse(message.value)
        let msg;
        //console.log(jsonMsg)
        const resuly = await handleProducts(jsonMsg)
        if (resuly==true) {//confirm order if handle products returned true
          const msg = {
            id: jsonMsg.id,
            state: "Confirmed"
          }
          sendOrders(msg)
        }else{//deny order if handle products returned false
          const msg = {
            id: jsonMsg.id,
            state: "Denied"
          }
          sendOrders(msg)

        }
        
      }
    })
  } catch (error) {
    await consumer.disconnect()
    console.log(error.message)
    
  }
}

setTimeout(async()=>{//wait 30 sec for required containers to start
  try {
    await fetchProductsFromOrderTopic()//start listening to topic
  } catch (error) {
    console.log(error.message)
  }

},30000)

module.exports = {
  kafkaProducer: sendOrders
}
