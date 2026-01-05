const sessionList = document.getElementById('session-list');
const emptyMsg = document.getElementById('empty-msg');

// Ngarko sesionet
const sessions = JSON.parse(localStorage.getItem('studySessions')) || [];

if (sessions.length > 0) {
    emptyMsg.style.display = 'none'; // Mshef mesazhin ''empty''
    
    sessions.forEach(session => {
        const card = document.createElement('div');
        card.className = 'session-card';
        card.innerHTML = `
            <h3>${session.field}</h3>
            <p><strong>Student:</strong> ${session.name}</p>
            <p><strong>Time:</strong> ${session.start} to ${session.end}</p>
            <p><strong>Date:</strong> ${session.date}</p>
        `;
        sessionList.appendChild(card);
    });
}
