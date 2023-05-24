local status, termIcons = pcall(require, "termicons")
if not status then
  return
end

termIcons.setup()
