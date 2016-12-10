describe('StaticController', () => {
  let subject

  beforeEach(() => {
  // MagicLamp.load("orders/form")
    subject = App.StaticController.create()
  })

  describe('#home', () => {
    it('returns a message', () => {
      let message = 'in the home action'
      expect(subject).not.to.be.nil
      expect(subject.home(message)).to.equal(message)
    })

    it('has a body element', () => {
      expect(subject.elements.home.body).to.equal('body')
    })
  })

  describe('#secure', () => {
    it('returns 5', () => {
      expect(subject.secure()).to.equal(5) // eslint-disable-line
    })
  })
})
