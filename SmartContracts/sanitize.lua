-- function to sanitize input data for smart contracts on MoltenChain
function sanitize(input)
  -- remove HTML tags
  input = input:gsub("<[^>]*>", "")

  -- escape special characters
  input = input:gsub("[^%w%s]", "")

  -- return the sanitized input
  return input
end

-- example usage
local input = "Hello, <script>alert('XSS')</script> world!"
local output = sanitize(input)
print(output) -- "Hello world!"
