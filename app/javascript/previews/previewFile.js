function previewFileWithId(id) {
    const target = event.target;
    const file = target.files[0];
    const reader  = new FileReader();
    const preview = document.getElementById(id); // "preview" というIDを持つ要素を取得

    reader.onloadend = function () {
        preview.src = reader.result;
    }

    if (file) {
        reader.readAsDataURL(file);
    } else {
        preview.src = '';
    }
}

document.addEventListener("DOMContentLoaded", function() {
  const fileInput = document.querySelector('input[type="file"]');
  if (fileInput) {
    fileInput.addEventListener('change', function() {
      previewFileWithId("preview");
    });
  }
});