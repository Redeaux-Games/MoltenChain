const AWS = require("aws-sdk");

// configure the AWS SDK
AWS.config.update({
  accessKeyId: "yourAccessKeyId",
  secretAccessKey: "yourSecretAccessKey",
  region: "yourRegion"
});

// function to store MoltenChain records on the cloud
async function storeRecords(records) {
  // create an S3 client
  const s3 = new AWS.S3();

  // the S3 bucket name
  const bucketName = "moltenchain-records";

  // the S3 key
  const key = "records.json";

  // create the S3 params
  const params = {
    Bucket: bucketName,
    Key: key,
    Body: JSON.stringify(records)
  };

  // upload the records to S3
  await s3.upload(params).promise();
}

// example usage
const records = [
  {
    block_height: 123,
    transactions: [
      {
        from: "0x1234",
        to: "0x5678",
        amount: 100,
        asset: "MAGMA"
      }
    ]
  },
  {
    block_height: 124,
    transactions: [
      {
        from: "0x5678",
        to: "0x9ABC",
        amount: 50,
        asset: "MAGMA"
      },
      {
        from: "0x1234",
        to: "0x9ABC",
        amount: 50,
        asset: "MAGMA"
      }
    ]
  }
];

storeRecords(records);
