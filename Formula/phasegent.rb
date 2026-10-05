class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.11/phasegent-v2.21.11-aarch64-apple-darwin"
      sha256 "0a1c05dc2951f7760ef7edcb8660c6bf610ef4ddf1f898166a655e60629a4de1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.11/phasegent-v2.21.11-aarch64-unknown-linux-gnu"
      sha256 "bd5812139e24f1df03c51d5027ae6c7808481db9f3451981ad6faf33bfc9d6e4"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.11/phasegent-v2.21.11-x86_64-unknown-linux-gnu"
      sha256 "560c00e22e017517e20dde549cfcef37232c9fc38da1d4d53eb5ae700b3bfa9d"
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
