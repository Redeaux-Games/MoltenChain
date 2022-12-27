// function to sanitize input data for smart contracts on MoltenChain
function sanitize(input: string): string {
  // remove HTML tags
  input = input.replace(/<[^>]*>/g, "");

  // escape special characters
  input = input.replace(/[^\w\s]/gi, "");

  // return the sanitized input
  return input;
}

// example usage
const input = "Hello, <script>alert('XSS')</script> world!";
const output = sanitize(input);
console.log(output); // "Hello world!"
