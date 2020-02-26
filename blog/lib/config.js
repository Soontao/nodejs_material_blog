

const CONNECTION_URI = process.env.BLOG_CONN_URI || "sqlite:blog.db"
const DEFAULT_USERNAME = process.env.BLOG_D_USERNAME || "admin"
const DEFAULT_USERNAME_PASSWORD = process.env.BLOG_D_USERNAME_PASSWORD || "nimda"

module.exports = { CONNECTION_URI, DEFAULT_USERNAME, DEFAULT_USERNAME_PASSWORD }