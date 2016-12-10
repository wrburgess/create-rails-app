App.createController('Static', {
  actions: ['home', 'secure'],

  elements: {
    home: {
      body: 'body',
      launchAlert: ['a.hello', { click: 'alertHelloWord' }],
    },
  },

  alertHelloWord() {
    alert('Hello World!') // eslint-disable-line
  },

  all() {
    console.log('Happens on every action')
  },

  home(payload) {
    console.log('Happens on home action')
    console.log(payload)
    console.log(this.$body)
    return payload
  },

  secure() {
    console.log('Happens on secure action')
    return 5 // eslint-disable-line
  },
})
