describe("Product Details", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
    cy.get(".products article").first().click();
  });

  it("displays the product details", () => {
    cy.get("ul").should("have.length", 4);
  });

  it("shows products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
});
