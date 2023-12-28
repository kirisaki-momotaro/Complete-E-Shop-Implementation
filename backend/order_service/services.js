const { connection } = require('./dbConnect')


const handleOrderState = async (orderConfirmaton) => {
console.log(orderConfirmaton);
const id = orderConfirmaton.id;
const state = orderConfirmaton.state;

try {
    const db = await connection;
    const update = await db.execute("UPDATE orders SET status = ? WHERE id = ?",
            [state, id])

} catch (error) {
    console.log(error);
    return false;
}
return true;

}
module.exports = { handleOrderState }