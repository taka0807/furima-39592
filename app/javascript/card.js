const pay = () => {
  const publicKey = gon.public_key
  const payjp = Payjp(publicKey) // PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();
    });
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);











// const pay = () => {
// 	const payjp = Payjp('pk_test_509a67a3fde7b53aaecf229f')// PAY.JPテスト公開鍵
// 	const purchaseButton = document.getElementById("button"); // 購入ボタンの要素を取得

//   if (purchaseButton) {
//     // 購入ボタンが存在する場合のみイベントを設定
//     purchaseButton.addEventListener("click", (event) => {
//       event.preventDefault(); // デフォルトのフォーム送信をキャンセル

//       console.log("購入ボタンがクリックされました");

// 			// カード情報入力フォームのDOMを取得
//       // const cardNumberInput = document.getElementById("number-form");
//       // const expiryInput = document.getElementById("expiry-form");
//       // const cvcInput = document.getElementById("cvc-form")
// 			const cardNumber = document.getElementById("number-form").value;
//       const expiry = document.getElementById("expiry-form").value;
//       const cvc = document.getElementById("cvc-form").value;

// 			// 取得したDOM要素をコンソールログに出力して確認
//       // console.log("カード番号入力フォーム:", cardNumberInput);
//       // console.log("有効期限入力フォーム:", expiryInput);
//       // console.log("CVC入力フォーム:", cvcInput);
// 			// console.log("カード番号:", cardNumber);
//       // console.log("有効期限:", expiry);
//       // console.log("CVC:", cvc);

// 			const form = document.getElementById('charge-form')
// 			form.addEventListener("submit", (e) => {
// 				payjp.createToken(numberElement).then(function (response) {
// 					if (response.error) {
// 					} else {
// 						const token = response.id;
// 						console.log(token)
// 					}
// 				});
// 				e.preventDefault();


//       // ここにPAY.JPのトークン生成とサーバーサイドへの送信処理を追加する
//       // PAY.JPのトークン生成やサーバーサイドへの送信処理を記述
//     });
//   // }
//   // console.log("カード情報トークン化のためのJavaScript");
// };

// window.addEventListener("turbo:load", pay);