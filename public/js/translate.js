// 日本語を中国語に翻訳して表示
function getChinese() {
  let qel = document.getElementById('q');
  let cel = document.getElementById('a');
  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
    },
  });
  $.ajax({
    type: "post", //HTTP通信の種類
    url: "/learner/chinese",
    dataType: "json",
    data: { japanese: qel.value },
  })
    //通信が成功したとき
    .then((res) => {
      cel.value = res.zh;
    })
    //通信が失敗したとき
    .fail((error) => {
      console.log(error.statusText);
    });
}

// ピンインと英訳を取得して表示
function getPinyin() {
  let type = document.getElementById('type').value;
  let cn = '';
  if (1 == type) {
    // 穴埋め問題の場合
    cn = document.getElementById('q_head').value +
    document.getElementById('a').value +
    document.getElementById('q_tail').value;
  } else {
    // 穴埋め問題以外の場合
    cn = document.getElementById('a').value;
  }
  let pel = document.getElementById('pinyin');
  let eel = document.getElementById('en');
  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
    },
  });
  $.ajax({
    type: "post", //HTTP通信の種類
    url: "/learner/pinyin",
    dataType: "json",
    data: { chinese: cn },
  })
    //通信が成功したとき
    .then((res) => {
      pel.value = res.pinyin;
      eel.value = res.english;
    })
    //通信が失敗したとき
    .fail((error) => {
      console.log(error.statusText);
    });
}

// 日本語を英語に翻訳して表示
function getEnglish() {
  let qel = document.getElementById('q');
  let eel = document.getElementById('a');
  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
    },
  });
  $.ajax({
    type: "post", //HTTP通信の種類
    url: "/learner/english",
    dataType: "json",
    data: { japanese: qel.value },
  })
    //通信が成功したとき
    .then((res) => {
      eel.value = res.en;
    })
    //通信が失敗したとき
    .fail((error) => {
      console.log(error.statusText);
    });
}