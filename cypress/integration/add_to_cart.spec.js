describe('Add to cart', () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000")
      .get(".products article")
      .first()
      .click()
      .get(".product-add-to-cart")
      .click()
      .get(".nav-link").eq(10).click();
  })

  it('displays the cart', () => {
    cy.get('.cart-show').should('be.visible')
  })

  it('displays the cart items', () => {
    cy.get('h4').should('be.visible')
  })
})