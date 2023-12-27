//check if amount of products is correct
//update database to substruct the amount of products sold
const {connection} = require('./dbConnect')

const handleProducts = async(order) => {
    try {
        const db = await connection;
        for await (const product of order.products){
            const productID = product.id;
            const amount=product.amount;
            const data = await db.execute("SELECT * FROM products WHERE id = ?", [productID]);

            
            const productInfo = data[0];
            const quantity = productInfo.quantity;
            console.log(quantity)

        }

        //procces the products
    } catch (error) {
        console.log(error.message)
        throw new Error(error)
        
    }
}

module.exports ={handleProducts}
