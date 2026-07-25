class Vine < Formula
  desc "Variational Inference with Node Embedding"
  homepage "https://github.com/CshlSiepelLab/vine"
  url "https://github.com/CshlSiepelLab/vine/archive/refs/tags/v0.3.5.tar.gz"
  sha256 "8eb4e5359ac2afc55894118c6d3399efac225e66fde9eb16b96742c213035414"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "phast"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args,
             "-DPHAST_ROOT=#{Formula["phast"].opt_prefix}"
      system "cmake", "--build", "."
      system "cmake", "--install", "."
    end
  end

  test do
    system "#{bin}/vine", "--help"
  end
end
