# From https://www.kaggle.com/fantop/wikiquote-short-english-quotes
import './quotes.json' as quotes_db

let quotes_list = []
for author, authors_quote of quotes_db
  for quote in authors_quote
    quotes_list.push({author: author, quote: quote})

tag Quote
  def render
    <self>
      <blockquote.quote>
        data:quote
      <div.author>
        "— {data:author}"

tag App
  def build
    random_quote

  def random_quote
    @quote = quotes_list[Math.floor(Math.random() * quotes_list:length)]

  def render
    <self>
      <header>
        "Quote Machine"
      <Quote[@quote]>
      <button :click.random_quote>
        "Get new quote"

Imba.mount <App>
