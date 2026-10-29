import React from 'react'
import { createRoot } from 'react-dom/client'
import { ApolloClient, HttpLink, InMemoryCache } from '@apollo/client'
import { ApolloProvider } from '@apollo/client/react'
import BookList from '../components/BookList'

const csrfToken = document.querySelector('meta[name="csrf-token"]')?.content

const client = new ApolloClient({
  link: new HttpLink({ uri: '/graphql', headers: { 'X-CSRF-Token': csrfToken } }),
  cache: new InMemoryCache(),
})

createRoot(document.getElementById('root')).render(
  <ApolloProvider client={client}>
    <BookList />
  </ApolloProvider>
)
