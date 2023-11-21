describe('Home', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it('displays the title h3', () => {
    cy.get(".title h3").should(
      "have.text",
      "Welcome to"
    );
  })

  it('displays the title h1', () => {
    cy.get(".title h1").should("have.text", "The Jungle");
  })

  it('displays the title h2', () => {
    cy.get(".title h2").should("have.text", "Where you can find any plants!");
  })

  it('displays the categories', () => {
    cy.get('ul').should('have.length', 4)
  })

  it('displays the product details', () => {
    cy.get('ul').should('have.length', 4)
  })

  it("shows products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
})