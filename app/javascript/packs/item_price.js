function price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    // 金額計算
    const salesCommission = Math.floor(inputValue * 0.1);
    const profit = Math.floor(inputValue * 0.9);
    
    // 表示するエリア
    const commissionArea = document.getElementById("add-tax-price");
    const profitArea = document.getElementById("profit");

    // 実際の表示
    commissionArea.innerHTML = salesCommission
    profitArea.innerHTML = profit

  })
}


window.addEventListener('load', price)