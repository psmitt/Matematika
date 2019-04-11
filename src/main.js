'use strict'

require('electron-reload')(__dirname)

const {
  app,
  BrowserWindow,
  dialog,
  Menu
} = require('electron')

Menu.setApplicationMenu(Menu.buildFromTemplate([{
  label: 'Szerkesztés',
  submenu: [{
    label: 'Másolás',
    role: 'copy',
    accelerator: 'Ctrl+C'
  }, {
    label: 'Beillesztés',
    role: 'paste',
    accelerator: 'Ctrl+V'
  }]
}, {
  label: 'Nézet',
  submenu: [{
    label: 'Alaphelyzet',
    role: 'resetZoom',
    accelerator: 'Ctrl+0'
  }, {
    label: 'Nagyítás',
    role: 'zoomIn',
    accelerator: 'Ctrl+numadd'
  }, {
    label: 'Kicsinyítés',
    role: 'zoomOut',
    accelerator: 'Ctrl+numsub'
  }, {
    label: 'Teljes képernyő Be/Ki',
    role: 'toggleFullScreen',
    accelerator: 'F11'
  }, {
    label: 'Fejlesztői eszközök Be/Ki',
    role: 'toggleDevTools',
    accelerator: 'F12'
  }]
}, {
  label: 'Ablak',
  submenu: [{
    label: 'Frissítés',
    role: 'forceReload',
    accelerator: 'Ctrl+R'
  }, {
    label: 'Nyomtatás',
    accelerator: 'Ctrl+P',
    click: (item, window) => {
      window.webContents.print()
    }
  }, {
    label: 'Tálcára küldés',
    role: 'minimize'
  }, {
    label: 'Bezárás',
    role: 'close',
    accelerator: 'Ctrl+F4'
  }, {
    label: 'Kilépés',
    role: 'quit',
    accelerator: 'Alt+F4'
  }]
}, {
  label: 'Súgó',
  submenu: [{
    label: `${app.getName()} névjegye`,
    role: 'about'
  }]
}]))

app.on('ready', () => {
  let mainWindow = new BrowserWindow({
    show: false,
    icon: 'eiPi.ico',
    webPreferences: {
      nodeIntegration: true
    }
  })
  mainWindow.knowledgebase = {
    host: 'localhost',
    port: '3306',
    database: 'math',
    user: 'math_editor',
    password: '012345678',
    supportBigNumbers: true,
    multipleStatements: true
  }
  if (process.argv[1] && process.argv[1] !== '.') {
    let port;
    [mainWindow.knowledgebase.host, port] = process.argv[1].split(':')
    mainWindow.knowledgebase.port = port || '3306'
  }
  mainWindow.loadFile('src/index.html')
  mainWindow.once('ready-to-show', () => mainWindow.maximize())
  mainWindow.on('closed', () => mainWindow = null)
})

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})