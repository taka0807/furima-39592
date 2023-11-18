const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profitDom = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  // 販売手数料の計算（10%）
  const tax = Math.floor(inputValue * 0.1);
  addTaxDom.innerHTML = tax.toLocaleString(); // 販売手数料を表示

  // 販売利益の計算
  const profit = inputValue - tax;
  profitDom.innerHTML = profit.toLocaleString(); // 販売利益を表示
});



// window.addEventListener('turbo:load', () => {
//   console.log("OK");
//   const priceInput = document.getElementById("item-price");
//   priceInput.addEventListener("input", () => {
//     const inputValue = priceInput.value;
//     console.log(inputValue);
//  })

//  const addTaxDom = document.getElementById("add-tax-price");
//     addTaxDom.innerHTML = tax.toLocaleString();