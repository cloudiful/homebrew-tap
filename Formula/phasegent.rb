class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.16.0/phasegent-v2.16.0-aarch64-apple-darwin"
      sha256 "fa8ac87dda88750a9b9d3ddc578046589f49bb93b86e4b76bfd0f9f51ae55008"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.16.0/phasegent-v2.16.0-aarch64-unknown-linux-gnu"
      sha256 "eaf7d494af0bba162298c947843f9e12da8f4b5ffc809525ee18e7a43fe7ea99"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.16.0/phasegent-v2.16.0-x86_64-unknown-linux-gnu"
      sha256 "c42b9317fb1192a65728b11996f0e9da4c564ff5e7f7c53364e907188107fdcb"
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
