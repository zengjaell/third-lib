# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    10/12 2019 14:40
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        10/12 2019      create the file
# 
#     last modified: 10/12 2019 14:40
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../../..
endif

PROJECT_TARGET_TOP 		:= ffmpeg
PROJECT_TARGET  		:= ffmpeg
TARGET_VERSION 			:= 4.2.1
TARGET_DOWNLOAD_PATH 	:= https://ffmpeg.org/releases

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

TARGET_PATH 			:= $(PROJECT_DIR)/$(PROJECT_TARGET_TOP)/$(PROJECT_TARGET)
PREFIX_PATH 			:= $(TARGET_PATH)/../../$(INSTALL_DIR)

all: $(TARGET_DIR)-make

include $(CONFIGS_DIR)/common_sub_target.mk

ifeq ($(PLATFORM), x86_64)
else ifeq ($(PLATFORM), r328)
CONFIG_LINE := --enable-cross-compile \
        	   --cross-prefix=$(CROSS_PREFIX) \
			   --target-os=linux \
			   --arch=arm \
			   --sysinclude=$(TOOLCHAINS_INC_DIR)
endif

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(TARGET_PATH)/$(@:-config=)/configure \
		--prefix=$(PREFIX_PATH) \
        --enable-shared \
        --disable-static \
		$(CONFIG_LINE) \
		\
		--enable-version3 \
        --disable-debug \
        --disable-doc \
        --disable-programs \
        --disable-parsers \
        --disable-filters \
        --disable-avfilter \
        --disable-swscale \
        --disable-avdevice \
        --disable-bsfs \
        --disable-encoders \
        --disable-muxers \
        --disable-outdevs \
        --disable-devices \
        --disable-neon \
		\
        --disable-decoder=aac \
        --disable-decoder=aac_fixed \
        --enable-decoder=libfdk_aac \
        --enable-libfdk-aac \
        --extra-cflags="-Os -I$(PREFIX_PATH)/include" \
        --extra-ldflags="-L$(PREFIX_PATH)/lib"

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

#$ ./configure --help
#Usage: configure [options]
#Options: [defaults in brackets after descriptions]
#
#Help options:
#  --help                   print this message
#  ....
#
#Standard options:
#  --prefix=PREFIX          install in PREFIX [/usr/local] --> 安装到指定的目录
#  ...
#
#Licensing options:
#  --enable-gpl             allow use of GPL code, the resulting libs
#                           and binaries will be under GPL [no] --> 允许使用GPL代码 由此产生的库文件和二进制文件将在GPL下
#  --enable-version3        upgrade (L)GPL to version 3 [no]
#  --enable-nonfree         allow use of nonfree code, the resulting libs
#                           and binaries will be unredistributable [no] --> 使用非自由代码，生成的libs和二进制文件将不可分发[否]
#
#Configuration options:
#  --disable-static         do not build static libraries [no] --> 设置生成静态库 （默认也是这样的可以不设置）
#  --enable-shared          build shared libraries [no] --> 设置不生成 动态库 （默认也是这样的可以不设置）
#  --enable-small           optimize for size instead of speed
#  --disable-runtime-cpudetect disable detecting CPU capabilities at runtime (smaller binary) --> 不检测cpu的能力在运行时（更小的2进制程序）
#  --enable-gray            enable full grayscale support (slower color) --> 使全灰度支持（慢，颜色）
#  --disable-swscale-alpha  disable alpha channel support in swscale --> 使alpha管道在swscale失去支持
#  --disable-all            disable building components, libraries and programs
#  --disable-autodetect     disable automatically detected external libraries [no]
#
#Program options:
#  --disable-programs       do not build command line programs
#  --disable-ffmpeg         disable ffmpeg build
#  --disable-ffplay         disable ffplay build
#  --disable-ffprobe        disable ffprobe build
#
#Documentation options:
#  --disable-doc            do not build documentation
#  --disable-htmlpages      do not build HTML documentation pages
#  --disable-manpages       do not build man documentation pages
#  --disable-podpages       do not build POD documentation pages
#  --disable-txtpages       do not build text documentation pages
#
#Component options:
#  --disable-avdevice       disable libavdevice build
#  --disable-avcodec        disable libavcodec build
#  --disable-avformat       disable libavformat build
#  --disable-swresample     disable libswresample build
#  --disable-swscale        disable libswscale build
#  --disable-postproc       disable libpostproc build
#  --disable-avfilter       disable libavfilter build
#  --enable-avresample      enable libavresample build (deprecated) [no]
#  --disable-pthreads       disable pthreads [autodetect] --> 禁止使用使能多线程
#  --disable-w32threads     disable Win32 threads [autodetect]
#  --disable-os2threads     disable OS/2 threads [autodetect]
#  --disable-network        disable network support [no]
#  --disable-dct            disable DCT code
#  --disable-dwt            disable DWT code
#  --disable-error-resilience disable error resilience code
#  --disable-lsp            disable LSP code
#  --disable-lzo            disable LZO decoder code
#  --disable-mdct           disable MDCT code
#  --disable-rdft           disable RDFT code
#  --disable-fft            disable FFT code
#  --disable-faan           disable floating point AAN (I)DCT code
#  --disable-pixelutils     disable pixel utils in libavutil
#
#Individual component options:
#  --disable-everything     disable all components listed below
#  --disable-encoder=NAME   disable encoder NAME
#  --enable-encoder=NAME    enable encoder NAME
#  --disable-encoders       disable all encoders --> 禁用所有编码器
#  --disable-decoder=NAME   disable decoder NAME
#  --enable-decoder=NAME    enable decoder NAME
#  --disable-decoders       disable all decoders --> 禁用所有解码器
#  --disable-hwaccel=NAME   disable hwaccel NAME
#  --enable-hwaccel=NAME    enable hwaccel NAME
#  --disable-hwaccels       disable all hwaccels
#  --disable-muxer=NAME     disable muxer NAME
#  --enable-muxer=NAME      enable muxer NAME
#  --disable-muxers         disable all muxers --> 关闭所有复用器(封装器)，不需要生成mp4这样的文件，所以关闭
#  --disable-demuxer=NAME   disable demuxer NAME
#  --enable-demuxer=NAME    enable demuxer NAME
#  --disable-demuxers       disable all demuxers --> 禁用所有解轨器
#  --enable-parser=NAME     enable parser NAME
#  --disable-parser=NAME    disable parser NAME
#  --disable-parsers        disable all parsers --> 禁用所有剖析器
#  --enable-bsf=NAME        enable bitstream filter NAME
#  --disable-bsf=NAME       disable bitstream filter NAME
#  --disable-bsfs           disable all bitstream filters
#  --enable-protocol=NAME   enable protocol NAME
#  --disable-protocol=NAME  disable protocol NAME
#  --disable-protocols      disable all protocols --> 禁用 I/O 协议支持（默认启用）
#  --enable-indev=NAME      enable input device NAME
#  --disable-indev=NAME     disable input device NAME
#  --disable-indevs         disable input devices
#  --enable-outdev=NAME     enable output device NAME
#  --disable-outdev=NAME    disable output device NAME
#  --disable-outdevs        disable output devices
#  --disable-devices        disable all devices
#  --enable-filter=NAME     enable filter NAME
#  --disable-filter=NAME    disable filter NAME
#  --disable-filters        disable all filters --> 关闭视频滤镜
#
#
#External library support:
#
#  Using any of the following switches will allow FFmpeg to link to the
#  corresponding external library. All the components depending on that library
#  will become enabled, if all their other dependencies are met and they are not
#  explicitly disabled. E.g. --enable-libwavpack will enable linking to
#  libwavpack and allow the libwavpack encoder to be built, unless it is
#  specifically disabled with --disable-encoder=libwavpack.
#
#  Note that only the system libraries are auto-detected. All the other external
#  libraries must be explicitly enabled.
#
#  Also note that the following help text describes the purpose of the libraries
#  themselves, not all their features will necessarily be usable by FFmpeg.
#
#  --disable-alsa           disable ALSA support [autodetect]
#  --disable-appkit         disable Apple AppKit framework [autodetect]
#  --disable-avfoundation   disable Apple AVFoundation framework [autodetect]
#  --enable-avisynth        enable reading of AviSynth script files [no]
#  --disable-bzlib          disable bzlib [autodetect]
#  --disable-coreimage      disable Apple CoreImage framework [autodetect]
#  --enable-chromaprint     enable audio fingerprinting with chromaprint [no]
#  --enable-frei0r          enable frei0r video filtering [no]
#  --enable-gcrypt          enable gcrypt, needed for rtmp(t)e support
#                           if openssl, librtmp or gmp is not used [no]
#  --enable-gmp             enable gmp, needed for rtmp(t)e support
#                           if openssl or librtmp is not used [no]
#  --enable-gnutls          enable gnutls, needed for https support
#                           if openssl, libtls or mbedtls is not used [no]
#  --disable-iconv          disable iconv [autodetect]
#  --enable-jni             enable JNI support [no]
#  --enable-ladspa          enable LADSPA audio filtering [no]
#  --enable-libaom          enable AV1 video encoding/decoding via libaom [no]
#  --enable-libaribb24      enable ARIB text and caption decoding via libaribb24 [no]
#  --enable-libass          enable libass subtitles rendering,
#                           needed for subtitles and ass filter [no]
#  --enable-libbluray       enable BluRay reading using libbluray [no]
#  --enable-libbs2b         enable bs2b DSP library [no]
#  --enable-libcaca         enable textual display using libcaca [no]
#  --enable-libcelt         enable CELT decoding via libcelt [no]
#  --enable-libcdio         enable audio CD grabbing with libcdio [no]
#  --enable-libcodec2       enable codec2 en/decoding using libcodec2 [no]
#  --enable-libdav1d        enable AV1 decoding via libdav1d [no]
#  --enable-libdavs2        enable AVS2 decoding via libdavs2 [no]
#  --enable-libdc1394       enable IIDC-1394 grabbing using libdc1394
#                           and libraw1394 [no]
#  --enable-libfdk-aac      enable AAC de/encoding via libfdk-aac [no]
#  --enable-libflite        enable flite (voice synthesis) support via libflite [no]
#  --enable-libfontconfig   enable libfontconfig, useful for drawtext filter [no]
#  --enable-libfreetype     enable libfreetype, needed for drawtext filter [no]
#  --enable-libfribidi      enable libfribidi, improves drawtext filter [no]
#  --enable-libgme          enable Game Music Emu via libgme [no]
#  --enable-libgsm          enable GSM de/encoding via libgsm [no]
#  --enable-libiec61883     enable iec61883 via libiec61883 [no]
#  --enable-libilbc         enable iLBC de/encoding via libilbc [no]
#  --enable-libjack         enable JACK audio sound server [no]
#  --enable-libklvanc       enable Kernel Labs VANC processing [no]
#  --enable-libkvazaar      enable HEVC encoding via libkvazaar [no]
#  --enable-liblensfun      enable lensfun lens correction [no]
#  --enable-libmodplug      enable ModPlug via libmodplug [no]
#  --enable-libmp3lame      enable MP3 encoding via libmp3lame [no]
#  --enable-libopencore-amrnb enable AMR-NB de/encoding via libopencore-amrnb [no]
#  --enable-libopencore-amrwb enable AMR-WB decoding via libopencore-amrwb [no]
#  --enable-libopencv       enable video filtering via libopencv [no]
#  --enable-libopenh264     enable H.264 encoding via OpenH264 [no]
#  --enable-libopenjpeg     enable JPEG 2000 de/encoding via OpenJPEG [no]
#  --enable-libopenmpt      enable decoding tracked files via libopenmpt [no]
#  --enable-libopus         enable Opus de/encoding via libopus [no]
#  --enable-libpulse        enable Pulseaudio input via libpulse [no]
#  --enable-librsvg         enable SVG rasterization via librsvg [no]
#  --enable-librubberband   enable rubberband needed for rubberband filter [no]
#  --enable-librtmp         enable RTMP[E] support via librtmp [no]
#  --enable-libshine        enable fixed-point MP3 encoding via libshine [no]
#  --enable-libsmbclient    enable Samba protocol via libsmbclient [no]
#  --enable-libsnappy       enable Snappy compression, needed for hap encoding [no]
#  --enable-libsoxr         enable Include libsoxr resampling [no]
#  --enable-libspeex        enable Speex de/encoding via libspeex [no]
#  --enable-libsrt          enable Haivision SRT protocol via libsrt [no]
#  --enable-libssh          enable SFTP protocol via libssh [no]
#  --enable-libtensorflow   enable TensorFlow as a DNN module backend
#                           for DNN based filters like sr [no]
#  --enable-libtesseract    enable Tesseract, needed for ocr filter [no]
#  --enable-libtheora       enable Theora encoding via libtheora [no]
#  --enable-libtls          enable LibreSSL (via libtls), needed for https support
#                           if openssl, gnutls or mbedtls is not used [no]
#  --enable-libtwolame      enable MP2 encoding via libtwolame [no]
#  --enable-libv4l2         enable libv4l2/v4l-utils [no]
#  --enable-libvidstab      enable video stabilization using vid.stab [no]
#  --enable-libvmaf         enable vmaf filter via libvmaf [no]
#  --enable-libvo-amrwbenc  enable AMR-WB encoding via libvo-amrwbenc [no]
#  --enable-libvorbis       enable Vorbis en/decoding via libvorbis,
#                           native implementation exists [no]
#  --enable-libvpx          enable VP8 and VP9 de/encoding via libvpx [no]
#  --enable-libwavpack      enable wavpack encoding via libwavpack [no]
#  --enable-libwebp         enable WebP encoding via libwebp [no]
#  --enable-libx264         enable H.264 encoding via x264 [no]
#  --enable-libx265         enable HEVC encoding via x265 [no]
#  --enable-libxavs         enable AVS encoding via xavs [no]
#  --enable-libxavs2        enable AVS2 encoding via xavs2 [no]
#  --enable-libxcb          enable X11 grabbing using XCB [autodetect]
#  --enable-libxcb-shm      enable X11 grabbing shm communication [autodetect]
#  --enable-libxcb-xfixes   enable X11 grabbing mouse rendering [autodetect]
#  --enable-libxcb-shape    enable X11 grabbing shape rendering [autodetect]
#  --enable-libxvid         enable Xvid encoding via xvidcore,
#                           native MPEG-4/Xvid encoder exists [no]
#  --enable-libxml2         enable XML parsing using the C library libxml2, needed
#                           for dash demuxing support [no]
#  --enable-libzimg         enable z.lib, needed for zscale filter [no]
#  --enable-libzmq          enable message passing via libzmq [no]
#  --enable-libzvbi         enable teletext support via libzvbi [no]
#  --enable-lv2             enable LV2 audio filtering [no]
#  --disable-lzma           disable lzma [autodetect]
#  --enable-decklink        enable Blackmagic DeckLink I/O support [no]
#  --enable-mbedtls         enable mbedTLS, needed for https support
#                           if openssl, gnutls or libtls is not used [no]
#  --enable-mediacodec      enable Android MediaCodec support [no]
#  --enable-libmysofa       enable libmysofa, needed for sofalizer filter [no]
#  --enable-openal          enable OpenAL 1.1 capture support [no]
#  --enable-opencl          enable OpenCL processing [no]
#  --enable-opengl          enable OpenGL rendering [no]
#  --enable-openssl         enable openssl, needed for https support
#                           if gnutls, libtls or mbedtls is not used [no]
#  --enable-pocketsphinx    enable PocketSphinx, needed for asr filter [no]
#  --disable-sndio          disable sndio support [autodetect]
#  --disable-schannel       disable SChannel SSP, needed for TLS support on
#                           Windows if openssl and gnutls are not used [autodetect]
#  --disable-sdl2           disable sdl2 [autodetect]
#  --disable-securetransport disable Secure Transport, needed for TLS support
#                           on OSX if openssl and gnutls are not used [autodetect]
#  --enable-vapoursynth     enable VapourSynth demuxer [no]
#  --disable-xlib           disable xlib [autodetect]
#  --disable-zlib           disable zlib [autodetect]
#
#  The following libraries provide various hardware acceleration features:
#  --disable-amf            disable AMF video encoding code [autodetect]
#  --disable-audiotoolbox   disable Apple AudioToolbox code [autodetect]
#  --enable-cuda-nvcc       enable Nvidia CUDA compiler [no]
#  --disable-cuda-llvm      disable CUDA compilation using clang [autodetect]
#  --disable-cuvid          disable Nvidia CUVID support [autodetect]
#  --disable-d3d11va        disable Microsoft Direct3D 11 video acceleration code [autodetect]
#  --disable-dxva2          disable Microsoft DirectX 9 video acceleration code [autodetect]
#  --disable-ffnvcodec      disable dynamically linked Nvidia code [autodetect]
#  --enable-libdrm          enable DRM code (Linux) [no]
#  --enable-libmfx          enable Intel MediaSDK (AKA Quick Sync Video) code via libmfx [no]
#  --enable-libnpp          enable Nvidia Performance Primitives-based code [no]
#  --enable-mmal            enable Broadcom Multi-Media Abstraction Layer (Raspberry Pi) via MMAL [no]
#  --disable-nvdec          disable Nvidia video decoding acceleration (via hwaccel) [autodetect]
#  --disable-nvenc          disable Nvidia video encoding code [autodetect]
#  --enable-omx             enable OpenMAX IL code [no]
#  --enable-omx-rpi         enable OpenMAX IL code for Raspberry Pi [no]
#  --enable-rkmpp           enable Rockchip Media Process Platform code [no]
#  --disable-v4l2-m2m       disable V4L2 mem2mem code [autodetect]
#  --disable-vaapi          disable Video Acceleration API (mainly Unix/Intel) code [autodetect]
#  --disable-vdpau          disable Nvidia Video Decode and Presentation API for Unix code [autodetect]
#  --disable-videotoolbox   disable VideoToolbox code [autodetect]
#
#Toolchain options:
#  --arch=ARCH              select architecture [] --> 设置平台
#  --cpu=CPU                select the minimum required CPU (affects
#                           instruction selection, may crash on older CPUs)
#  --cross-prefix=PREFIX    use PREFIX for compilation tools [] --> 设置交叉编译用到的 gcc
#  --progs-suffix=SUFFIX    program name suffix [] --> 设置程序名的后缀
#  --enable-cross-compile   assume a cross-compiler is used --> 开启交叉编译
#  --sysroot=PATH           root of cross-build tree --> 设置 内部c c++ 文件引用的 头文件 和库文件 的 查找位置
#  --sysinclude=PATH        location of cross-build system headers
#  --target-os=OS           compiler targets OS [] --> 设置运行的系统
#  --target-exec=CMD        command to run executables on target
#  --target-path=DIR        path to view of build directory on target
#  --target-samples=DIR     path to samples directory on target
#  --tempprefix=PATH        force fixed dir/prefix instead of mktemp for checks
#  --toolchain=NAME         set tool defaults according to NAME
#                           (gcc-asan, clang-asan, gcc-msan, clang-msan,
#                           gcc-tsan, clang-tsan, gcc-usan, clang-usan,
#                           valgrind-massif, valgrind-memcheck,
#                           msvc, icl, gcov, llvm-cov, hardened)
#  --nm=NM                  use nm tool NM [nm -g]
#  --ar=AR                  use archive tool AR [ar]
#  --as=AS                  use assembler AS []
#  --ln_s=LN_S              use symbolic link tool LN_S [ln -s -f]
#  --strip=STRIP            use strip tool STRIP [strip]
#  --windres=WINDRES        use windows resource compiler WINDRES [windres]
#  --x86asmexe=EXE          use nasm-compatible assembler EXE [nasm]
#  --cc=CC                  use C compiler CC [gcc]
#  --cxx=CXX                use C compiler CXX [g++]
#  --objcc=OCC              use ObjC compiler OCC [gcc]
#  --dep-cc=DEPCC           use dependency generator DEPCC [gcc]
#  --nvcc=NVCC              use Nvidia CUDA compiler NVCC or clang []
#  --ld=LD                  use linker LD []
#  --pkg-config=PKGCONFIG   use pkg-config tool PKGCONFIG [pkg-config]
#  --pkg-config-flags=FLAGS pass additional flags to pkgconf []
#  --ranlib=RANLIB          use ranlib RANLIB [ranlib]
#  --doxygen=DOXYGEN        use DOXYGEN to generate API doc [doxygen]
#  --host-cc=HOSTCC         use host C compiler HOSTCC
#  --host-cflags=HCFLAGS    use HCFLAGS when compiling for host
#  --host-cppflags=HCPPFLAGS use HCPPFLAGS when compiling for host
#  --host-ld=HOSTLD         use host linker HOSTLD
#  --host-ldflags=HLDFLAGS  use HLDFLAGS when linking for host
#  --host-extralibs=HLIBS   use libs HLIBS when linking for host
#  --host-os=OS             compiler host OS []
#  --extra-cflags=ECFLAGS   add ECFLAGS to CFLAGS [] --> 指定额外的cflags
#  --extra-cxxflags=ECFLAGS add ECFLAGS to CXXFLAGS []
#  --extra-objcflags=FLAGS  add FLAGS to OBJCFLAGS []
#  --extra-ldflags=ELDFLAGS add ELDFLAGS to LDFLAGS [] --> 指定额外的ldflags
#  --extra-ldexeflags=ELDFLAGS add ELDFLAGS to LDEXEFLAGS []
#  --extra-ldsoflags=ELDFLAGS add ELDFLAGS to LDSOFLAGS []
#  --extra-libs=ELIBS       add ELIBS [] --> 制定链接的额外库
#  --extra-version=STRING   version string suffix []
#  --optflags=OPTFLAGS      override optimization-related compiler flags
#  --nvccflags=NVCCFLAGS    override nvcc flags []
#  --build-suffix=SUFFIX    library name suffix []
#  --enable-pic             build position-independent code
#  --enable-thumb           compile for Thumb instruction set
#  --enable-lto             use link-time optimization
#  --env="ENV=override"     override the environment variables
#
#Advanced options (experts only):
#  --malloc-prefix=PREFIX   prefix malloc and related names with PREFIX
#  --custom-allocator=NAME  use a supported custom allocator
#  --disable-symver         disable symbol versioning
#  --enable-hardcoded-tables use hardcoded tables instead of runtime generation
#  --disable-safe-bitstream-reader
#                           disable buffer boundary checking in bitreaders
#                           (faster, but may crash)
#  --sws-max-filter-size=N  the max filter size swscale uses [256]
#
#Optimization options (experts only):
#  --disable-asm            disable all assembly optimizations
#  --disable-altivec        disable AltiVec optimizations
#  --disable-vsx            disable VSX optimizations
#  --disable-power8         disable POWER8 optimizations
#  --disable-amd3dnow       disable 3DNow! optimizations
#  --disable-amd3dnowext    disable 3DNow! extended optimizations
#  --disable-mmx            disable MMX optimizations
#  --disable-mmxext         disable MMXEXT optimizations
#  --disable-sse            disable SSE optimizations
#  --disable-sse2           disable SSE2 optimizations
#  --disable-sse3           disable SSE3 optimizations
#  --disable-ssse3          disable SSSE3 optimizations
#  --disable-sse4           disable SSE4 optimizations
#  --disable-sse42          disable SSE4.2 optimizations
#  --disable-avx            disable AVX optimizations
#  --disable-xop            disable XOP optimizations
#  --disable-fma3           disable FMA3 optimizations
#  --disable-fma4           disable FMA4 optimizations
#  --disable-avx2           disable AVX2 optimizations
#  --disable-avx512         disable AVX-512 optimizations
#  --disable-aesni          disable AESNI optimizations
#  --disable-armv5te        disable armv5te optimizations
#  --disable-armv6          disable armv6 optimizations
#  --disable-armv6t2        disable armv6t2 optimizations
#  --disable-vfp            disable VFP optimizations
#  --disable-neon           disable NEON optimizations
#  --disable-inline-asm     disable use of inline assembly
#  --disable-x86asm         disable use of standalone x86 assembly
#  --disable-mipsdsp        disable MIPS DSP ASE R1 optimizations
#  --disable-mipsdspr2      disable MIPS DSP ASE R2 optimizations
#  --disable-msa            disable MSA optimizations
#  --disable-msa2           disable MSA2 optimizations
#  --disable-mipsfpu        disable floating point MIPS optimizations
#  --disable-mmi            disable Loongson SIMD optimizations
#  --disable-fast-unaligned consider unaligned accesses slow
#
#Developer options (useful when working on FFmpeg itself):
#  --disable-debug          disable debugging symbols --> 不允许使用调试信息
#  --enable-debug=LEVEL     set the debug level []
#  --disable-optimizations  disable compiler optimizations
#  --enable-extra-warnings  enable more compiler warnings
#  --disable-stripping      disable stripping of executables and shared libraries
#  --assert-level=level     0(default), 1 or 2, amount of assertion testing,
#                           2 causes a slowdown at runtime.
#  --enable-memory-poisoning fill heap uninitialized allocated space with arbitrary data
#  --valgrind=VALGRIND      run "make fate" tests through valgrind to detect memory
#                           leaks and errors, using the specified valgrind binary.
#                           Cannot be combined with --target-exec
#  --enable-ftrapv          Trap arithmetic overflows
#  --samples=PATH           location of test samples for FATE, if not set use
#                           $FATE_SAMPLES at make invocation time.
#  --enable-neon-clobber-test check NEON registers for clobbering (should be
#                           used only for debugging purposes)
#  --enable-xmm-clobber-test check XMM registers for clobbering (Win64-only;
#                           should be used only for debugging purposes)
#  --enable-random          randomly enable/disable components
#  --disable-random
#  --enable-random=LIST     randomly enable/disable specific components or
#  --disable-random=LIST    component groups. LIST is a comma-separated list
#                           of NAME[:PROB] entries where NAME is a component
#                           (group) and PROB the probability associated with
#                           NAME (default 0.5).
#  --random-seed=VALUE      seed value for --enable/disable-random
#  --disable-valgrind-backtrace do not print a backtrace under Valgrind
#                           (only applies to --disable-optimizations builds)
#  --enable-ossfuzz         Enable building fuzzer tool
#  --libfuzzer=PATH         path to libfuzzer
#  --ignore-tests=TESTS     comma-separated list (without "fate-" prefix
#                           in the name) of tests whose result is ignored
#  --enable-linux-perf      enable Linux Performance Monitor API
#
#NOTE: Object files are built at the place where configure is launched.
