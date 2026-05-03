    <div class="noti-panel">
        <div class="noti-header">
            <h3>Notifications</h3>
            <button class="mark-as-read">Mark as Read</button>
        </div>
        <hr>
        <ul class="noti-list">
            <li><span>Shanice101 commented on your thread, “So true, wish it was me!”!</span></li>
            <li><span>BabaRamdev192 liked your thread!</span></li>
            <li><span>Harleyman900 replied to your comment, “Yea, that does happen from time t...</span></li>
            <li><span>Your post, “Check out my pet rock!” got 3 reports!</span></li>
            <li><span>David292 mentioned you in a thread!</span></li>
            <li><span>Davie505 posted a new thread in “Animals_club” community. </span></li>
            <li><span>hyeana202 commented on your thread, “THAT IS DOPE DUDE!!”</span></li>
            <li><span>Shanice101 replied to your comment, “Is there any recommendations you give...</span></li>
        </ul>
    </div>

<script>
    const markAsReadBtn = document.querySelector('.mark-as-read');
    const notiItems = document.querySelectorAll('.noti-list li');

    markAsReadBtn.addEventListener('click', () => {
        notiItems.forEach(item => {
            item.style.opacity = '0.5';
        });
    });

    const notipanel = document.querySelector('.noti-panel');
    let notificationStatus = false;
    function showNotification() {
        if(notificationStatus) {
            notipanel.style.display = 'none';
            notificationStatus = false;
            return;
        }
        else {
            notipanel.style.display = 'block';
            notificationStatus = true;
        }
    }
</script>