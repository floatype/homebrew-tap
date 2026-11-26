cask "floatype" do
  version "0.1.15,3.35.6354"
  sha256 "787e2f644356001f6c7472c22b8c5a6b1f9e09be33eb5e5a5227d63f40e183ac"

  url "https://github.com/floatype/floatype/releases/download/v#{version.csv.first}/floatype-#{version.csv.first}+mozc.#{version.csv.second}.pkg"
  name "Floatype"
  desc "Japanese input method based on Mozc with zenz"
  homepage "https://github.com/floatype/floatype"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

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

    brew uninstall しても、設定と学習（~/.config/floatype と
    ~/Library/Application Support/floatype）は残ります。
  EOS
end
