class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.24.0/phasegent-v2.24.0-aarch64-apple-darwin"
      sha256 "c0636d4f8ee0283a3fa25486c0673b5d40473bfea0ffb533a42e87cf5f959a5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.24.0/phasegent-v2.24.0-aarch64-unknown-linux-gnu"
      sha256 "3ccbd6dde22bf6548e9cef2365dc810f4dd403f8dccae8363138d16c884753da"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.24.0/phasegent-v2.24.0-x86_64-unknown-linux-gnu"
      sha256 "81754e453247101e37c58036b17bfec4156224409a5969cfffef4b1deac9d974"
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
