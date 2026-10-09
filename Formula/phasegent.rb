class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.22.0/phasegent-v2.22.0-aarch64-apple-darwin"
      sha256 "a10b2abb09558bd45cfeab9472573cd8cbf17f89df432a5e6f911b8eab9174da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.22.0/phasegent-v2.22.0-aarch64-unknown-linux-gnu"
      sha256 "9facf6fbb5c4cbc8a54ff7ac663277d65f0d2a9dec90f489bfead9e80e3a1f6a"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.22.0/phasegent-v2.22.0-x86_64-unknown-linux-gnu"
      sha256 "32d10c04e932b9520ca84454d2c77c9a8078b4cb2cb55f349519f102585532a2"
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
