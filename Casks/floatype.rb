cask "floatype" do
  version "0.1.16,3.35.6354"
  sha256 "888592b55e607f1045d546c4324affe8b81d0c9a59c26e5671dcd479e0500970"

  url "https://github.com/floatype/floatype/releases/download/v#{version.csv.first}/floatype-#{version.csv.first}+mozc.#{version.csv.second}.pkg"
  name "Floatype"
  desc "Japanese input method based on Mozc with zenz"
  homepage "https://github.com/floatype/floatype"

  depends_on arch: :arm64
  depends_on macos: :monterey

  pkg "floatype-#{version.csv.first}+mozc.#{version.csv.second}.pkg"

  # The settings and the learning in ~/.config/floatype and
  # ~/Library/Application Support/floatype stay.
  uninstall launchctl: [
              "io.github.floatype.inputmethod.Japanese.Converter",
              "io.github.floatype.inputmethod.Japanese.Renderer",
            ],
            pkgutil:   "io.github.floatype.pkg.JapaneseInput"

  caveats <<~EOS
    入れたあと、ログアウトしてログインし直してください。
    そのあと、システム設定 → キーボード → 入力ソース の「編集…」で「＋」を押し、
    日本語の「Floatype」を足します。

    brew upgrade のあとも、ログアウトしてログインし直してください。
    それまでは入力メニューから Floatype が消えることがあります。

    brew uninstall しても、設定と学習（~/.config/floatype と
    ~/Library/Application Support/floatype）は残ります。
  EOS
end
