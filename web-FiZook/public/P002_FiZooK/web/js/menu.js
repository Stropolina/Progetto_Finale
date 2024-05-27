const initApp = () => {
    const sidebarBtnOpen = document.getElementById('sidebar-button-open')
    const mobileMenu = document.getElementById('mobile-menu')
    const userMenu = document.getElementById('user-menu')
    const userBtn = document.getElementById('user-menu-button')

    const toggleUserMenu = () => {
        userMenu.classList.toggle('hidden')
    }

    const toggleMobileMenu = () => {
        mobileMenu.classList.toggle('hidden')
    }

    sidebarBtnOpen.addEventListener('click', toggleMobileMenu)
    userBtn.addEventListener('click', toggleUserMenu)
}

document.addEventListener('DOMContentLoaded', initApp)