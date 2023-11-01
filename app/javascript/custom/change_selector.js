document.addEventListener('turbo:load', function() {
  var chapterSelect = document.getElementById('curriculum_log_chapter_id');
  var curriculumSelect = document.getElementById('curriculum_log_curriculum_id');

  chapterSelect.addEventListener('change', function() {
    var selectedChapterId = chapterSelect.value;

    if (selectedChapterId) {
      fetch(`/curriculums/update_curriculums?chapter_id=${selectedChapterId}`, {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json'
        }
      })
      .then(response => response.json())
      .then(data => {
        curriculumSelect.innerHTML = data.options;
      })
      .catch(error => console.error('エラー:', error));
    }
  });

  curriculumSelect.addEventListener('change', function() {
    var selectedCurriculumId = curriculumSelect.value;

    if (selectedCurriculumId) {
      fetch(`/chapters/update_chapters?curriculum_id=${selectedCurriculumId}`, {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json'
        }
      })
      .then(response => response.json())
      .then(data => {
        var selectedValue = data.selected_value;
        for (var i = 0; i < chapterSelect.options.length; i++) {
          if (chapterSelect.options[i].value == selectedValue) {
            chapterSelect.selectedIndex = i;
            break;
          }
        }
      })
      .catch(error => console.error('エラー:', error));
    }
  });
});