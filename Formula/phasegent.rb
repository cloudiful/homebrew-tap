class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.27.1/phasegent-v2.27.1-aarch64-apple-darwin"
      sha256 "53cb6f4478645e6d8f734c66ea7b8a60e622f2183cfab92fb4dd94fdf1cfe24f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.27.1/phasegent-v2.27.1-aarch64-unknown-linux-gnu"
      sha256 "381bd79dc72024fd4b8d80cff17220296c25690834ee9a92f8971acc6cd97b4c"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.27.1/phasegent-v2.27.1-x86_64-unknown-linux-gnu"
      sha256 "bb3f11e6b13d43be3e952c2108c59f7eeb36d2d4ebedd060cd767b8cd3f1192a"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install Dir["phasegent-*"].first => "phasegent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phasegent --version")
  end
end
