class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.30.0/phasegent-v2.30.0-aarch64-apple-darwin"
      sha256 "a28a66dde3bb3a37416b9e83744a8b3b997c5b28b76e81e56a9578b6577b8da1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.30.0/phasegent-v2.30.0-aarch64-unknown-linux-gnu"
      sha256 "870dd2d1fd8bcbc7ac3304645f3c16ae29f8ca8aa8b254adce7b87b4bfbcf4c7"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.30.0/phasegent-v2.30.0-x86_64-unknown-linux-gnu"
      sha256 "db1a45e67001e24316a93e6664334b22ab333fedbab1348417831eeeaa5f104d"
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
