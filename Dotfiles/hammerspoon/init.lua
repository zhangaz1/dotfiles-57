-- require modules into global namespace so they are available in the console
bindings                    = require('bindings')
window                      = require('ext.window')
notify                      = require('utils.notify')
watchers                    = require('utils.watchers')
mediakeys                   = require('utils.mediakeys')
dots                        = require('utils.spaces.dots')
quickswitch                 = require('utils.spaces.quickswitch')
urlevent                    = require('utils.watchers.urlevent')
controlplane                = require('utils.controlplane')

-- extension settings
window.margin               = 6
window.fullFrame            = true
window.fixEnabled           = false
window.historyLimit         = 20

-- spaces dots settings
dots.size                   = 8
dots.distance               = 16
dots.selectedAlpha          = 0.45
dots.alpha                  = 0.15

-- hs settings
hs.window.animationDuration = 0.15
hs.hints.fontName           = 'Helvetica-Bold'
hs.hints.fontSize           = 22
hs.hints.showTitleThresh    = 0
hs.hints.hintChars          = { 'A', 'S', 'D', 'F', 'J', 'K', 'L', 'Q', 'W', 'E', 'R', 'Z', 'X', 'C' }

-- urlevent browser preference
urlevent.browserPreference  = { 'Safari', 'Google Chrome' }

-- enable notifications
notify.enabled              = { 'battery', 'online', 'wifi' }

-- enable watchers
watchers.enabled            = { 'application', 'reload', 'urlevent' }

-- enable controlplane extensions
controlplane.enabled        = { 'automount', 'bluetooth', 'displays', 'persistvpn' }

-- start everything
hs.fnutils.each({
  bindings,
  controlplane,
  dots,
  mediakeys,
  notify,
  quickswitch,
  watchers
}, function(module) module.start() end)
