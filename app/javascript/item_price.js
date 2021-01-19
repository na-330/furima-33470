window.addEventListener('load', () => {
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener("input", () => {
    const price = document.getElementById('item-price').value;
    const addTax = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit');
    const Tax = Math.floor(price * 0.1);
    const addProfit = Math.floor(price - Tax);
    addTax.innerHTML = Tax;
    profit.innerHTML = addProfit;
  })
});