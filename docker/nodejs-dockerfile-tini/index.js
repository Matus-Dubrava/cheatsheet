const express = require('express');

const app = express();
const PORT = process.env.PORT;

app.get('/', (req, res) => {
	return res.send('hello world');
});

app.listen(PORT, () => {
	console.log(`server listening on port ${PORT}`);
});
