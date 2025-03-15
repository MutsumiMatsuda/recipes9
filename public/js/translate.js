function getPinyin() {
  let type = document.getElementById('type').value;
  let cn = '';
  if (0 == type) {
    cn = document.getElementById('a').value;
  } else {
    cn = document.getElementById('q_head').value +
    document.getElementById('a').value +
    document.getElementById('q_tail').value;
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