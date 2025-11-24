class Vine < Formula
  desc "Variational Inference with Node Embedding"
  homepage "https://github.com/CshlSiepelLab/vine"
  url "https://github.com/CshlSiepelLab/vine/archive/refs/tags/0.1.0.tar.gz"
  sha256 "2f0f752d835873b8885fb0ecf7ef47ac8ee66ff88feddf37726267eca4f33f47"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "phast"
  depends_on "openblas" # for Linux, similar as above if needed

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
