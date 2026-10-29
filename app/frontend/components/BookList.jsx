import React from 'react'
import { gql } from '@apollo/client'
import { useQuery } from '@apollo/client/react'

const BOOKS = gql`
  query Books {
    books {
      id
      title
      author
      genre
      rating
    }
  }
`

export default function BookList() {
  const { data, loading, error } = useQuery(BOOKS)

  if (loading) return <p>Loading…</p>
  if (error) return <p>Something went wrong: {error.message}</p>

  return (
    <main style={{ fontFamily: 'system-ui', maxWidth: 720, margin: '40px auto', padding: '0 16px' }}>
      <h1>Bookshelf</h1>
      <table width="100%" cellPadding={8}>
        <thead>
          <tr><th align="left">Title</th><th align="left">Author</th><th align="left">Genre</th><th align="right">Rating</th></tr>
        </thead>
        <tbody>
          {data.books.map((book) => (
            <tr key={book.id}>
              <td>{book.title}</td><td>{book.author}</td><td>{book.genre}</td><td align="right">{book.rating}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </main>
  )
}
