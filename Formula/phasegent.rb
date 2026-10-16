class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.28.0/phasegent-v2.28.0-aarch64-apple-darwin"
      sha256 "bf325495491cda9bd036598bbb9c2fe6fc6fceb9984f6cacd233a38a8b02b25a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.28.0/phasegent-v2.28.0-aarch64-unknown-linux-gnu"
      sha256 "982b5563775758a130ddc7da8abf1bf63e6a4651f710119b65a72ef28b1a2996"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.28.0/phasegent-v2.28.0-x86_64-unknown-linux-gnu"
      sha256 "2d9a2014871e5242eea2446d0e6faced9bf1cd24dc437a12418243ed1672f664"
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
