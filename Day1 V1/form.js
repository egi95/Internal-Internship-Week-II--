const studyForm = document.getElementById('study-form');

studyForm.addEventListener('submit', (e) => {
    e.preventDefault();

    // 1. Krijo nje sesion
    const newSession = {
        name: document.getElementById('user-name').value,
        field: document.getElementById('study-field').value,
        start: document.getElementById('start-time').value,
        end: document.getElementById('end-time').value,
        date: document.getElementById('study-date').value
    };

    const sessions = JSON.parse(localStorage.getItem('studySessions')) || [];
    
    sessions.push(newSession);
    localStorage.setItem('studySessions', JSON.stringify(sessions));

    // 4. Redirect back to Home
    window.location.href = 'index.html';
});
