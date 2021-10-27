# mock projects
Project.create([
  {
    name: 'Super Heroes List',
    language: 'JavaScript',
    framework: 'React',
    description: 'Por meio de uma API, o FrontEnd poderá criar usuários que terão acesso a base de mais de 700 personsagens para consulta e criação de sua própria lista de personagens favoritos, além disso, também será possível alterar os dados cadastrados.',
    image: 'https://www.significados.com.br/foto/hqdefault_sm.jpg',
  },
  {
    name: 'TypeScript Delivery App',
    language: 'TypeScript',
    framework: 'React',
    description: 'A aplicação se trata de um e-commerce de bebidas. Onde o usuário poderá se cadastrar, adicionar bebidas ao carrinho, escolher um vendedor, confirmar a compra e acompanhar em tempo real o status do seu pedido.',
    image: 'https://www.significados.com.br/foto/hqdefault_sm.jpg',
  },
])

Tag.create([
  {
    name: 'JavaScript',
    project_id: 1,
  },
  {
    name: 'React',
    project_id: 1,
  },
  {
    name: 'Styled-Components',
    project_id: 1,
  },
  {
    name: 'TypeScript',
    project_id: 2,
  },
  {
    name: 'React',
    project_id: 2,
  },
  {
    name: 'Styled-Components',
    project_id: 2,
  },
])
