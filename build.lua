#!/usr/bin/env texlua

-- Build script for "siunitx" files

-- Identify the bundle and module
bundle = ""
module = "siunitx"

-- Release a TDS-style zip
packtdszip = true

-- Two configs
checkconfigs = {"build","config-pdfstring"}

-- Typeset only the .tex files
typesetfiles = {"*.tex"}

-- Shorten the tagging list
tagfiles = {"siunitx.dtx"}

-- Detail how to set the version automatically
function update_tag(file,content,tagname,tagdate)
  return string.gsub(content,
    "\n\\ProvidesExplPackage %{siunitx%} %{[^}]+%} %{[^}]+%}\n",
    "\n\\ProvidesExplPackage {siunitx} {"
      .. tagdate .. "} {" .. string.gsub(tagname, "^v", "") .. "}\n")
end

function tag_hook(tagname)
  os.execute('git commit -a -m "Step tag"')
--  os.execute('git tag -a -m "" ' .. tagname)
end

