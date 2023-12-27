//update database for products amount
const { connection } = require('./dbConnect')

const handleProducts = async (orders)=>{
    try {
        const db = await connection;

        //check if products amount is > 0
        console.log(orders);
        for await (const obj of orders.products){
            console.log(obj)
            const productID=obj.id;
            const data = await db.query("SELECT * FROM products WHERE `id`=?",
                                        [productID])

            const quantity = data[0][0].quantity
            console.log(quantity)
            if((quantity -obj.amount)<0){
                console.log("not enough supply")
                return false
            }
        }

        for await (const obj of orders.products){
            const data = await db.query("SELECT * FROM products WHERE `id`=?",
                                        [obj.id])

            const newQuantity = data[0][0].quantity - obj.amount
            const update = await db.execute("UPDATE products SET quantity = ? WHERE id = ?",
            [newQuantity, obj.id])
        }

        return true

    } catch (error) {
        console.log(error.message)
        throw new Error(error)
    }
}

module.exports = { handleProducts }