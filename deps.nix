{ lib, beamPackages, overrides ? (x: y: {}) }:

let
  buildRebar3 = lib.makeOverridable beamPackages.buildRebar3;
  buildMix = lib.makeOverridable beamPackages.buildMix;
  buildErlangMk = lib.makeOverridable beamPackages.buildErlangMk;

  self = packages // (overrides self packages);

  packages = with beamPackages; with self; {
    bunt = buildMix rec {
      name = "bunt";
      version = "0.2.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0lw3v9kwbbcy1v6ygziiky887gffwwmxvyg4r1v0zm71kzhcgxbs";
      };

      beamDeps = [];
    };

    cachex = buildMix rec {
      name = "cachex";
      version = "3.3.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "189irin4xkbnj6b3ih1h5fvli1xq6m1sz1xiyqryyk71vphmw3nr";
      };

      beamDeps = [ eternal jumper sleeplocks unsafe ];
    };

    certifi = buildRebar3 rec {
      name = "certifi";
      version = "2.6.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0zmvagzisnk7lj5pfipl19mjq9wn70i339hpbkfljf0vk6s9fk2j";
      };

      beamDeps = [];
    };

    cldr_utils = buildMix rec {
      name = "cldr_utils";
      version = "2.16.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0ivvgypfid82rg2gy2k0q1lxmfhffv7jd9xxp2jaarp5vw7xrx9y";
      };

      beamDeps = [ certifi decimal ];
    };

    cobertura_cover = buildMix rec {
      name = "cobertura_cover";
      version = "0.9.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1cd0pvbbnbz7lgl7h0p0qhnls8r5i5l6n87i2c6wiidciijw82w7";
      };

      beamDeps = [];
    };

    combine = buildMix rec {
      name = "combine";
      version = "0.10.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "06s5y8b0snr1s5ax9v3s7rc6c8xf5vj6878d1mc7cc07j0bvq78v";
      };

      beamDeps = [];
    };

    connection = buildMix rec {
      name = "connection";
      version = "1.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1746n8ba11amp1xhwzp38yfii2h051za8ndxlwdykyqqljq1wb3j";
      };

      beamDeps = [];
    };

    cowboy = buildErlangMk rec {
      name = "cowboy";
      version = "2.8.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "12mcbyqyxjynzldcfm7kbpxb7l7swqyq0x9c2m6nvjaalzxy8hs6";
      };

      beamDeps = [ cowlib ranch ];
    };

    cowboy_telemetry = buildRebar3 rec {
      name = "cowboy_telemetry";
      version = "0.3.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1bzhcdq12p837cii2jgvzjyrffiwgm5bsb1pra2an3hkcqrzsvis";
      };

      beamDeps = [ cowboy telemetry ];
    };

    cowlib = buildRebar3 rec {
      name = "cowlib";
      version = "2.9.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0w318ynls1iqvl5p8icyfbhysf12qvhr220narhrj3d78315s5z4";
      };

      beamDeps = [];
    };

    credo = buildMix rec {
      name = "credo";
      version = "1.4.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "14kniigjhzwnx5r080x1lv5gs80ksjh1yafqwm6m0xxdi4lqlpqm";
      };

      beamDeps = [ bunt jason ];
    };

    db_connection = buildMix rec {
      name = "db_connection";
      version = "2.4.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1j6psw0dxq1175b6zcqpm6vavv4n6sv72ji57l8b6qczmlhnqhdd";
      };

      beamDeps = [ connection telemetry ];
    };

    decimal = buildMix rec {
      name = "decimal";
      version = "2.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0xzm8hfhn8q02rmg8cpgs68n5jz61wvqg7bxww9i1a6yanf6wril";
      };

      beamDeps = [];
    };

    dialyxir = buildMix rec {
      name = "dialyxir";
      version = "1.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0m26cpw56gq1q47x1w7p5jy3sxaj5la1l1nq13519b2z2j46bc5f";
      };

      beamDeps = [ erlex ];
    };

    earmark_parser = buildMix rec {
      name = "earmark_parser";
      version = "1.4.13";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1fhlh9bnph5nqdhy7w69xzb7lra1b3v16mk4yb947bx0ydmc40nn";
      };

      beamDeps = [];
    };

    ecto = buildMix rec {
      name = "ecto";
      version = "3.7.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0r8ip9zg0yq24d9m4m0lk85va3h78mskxg11178g79j4spn2q89s";
      };

      beamDeps = [ decimal jason telemetry ];
    };

    ecto_sql = buildMix rec {
      name = "ecto_sql";
      version = "3.7.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0w0gqvmlyyh7avxfwqg79xd579mv4px4qilcj9xgi6yrl7gkaqd2";
      };

      beamDeps = [ db_connection ecto postgrex telemetry ];
    };

    erlex = buildMix rec {
      name = "erlex";
      version = "0.2.6";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0x8c1j62y748ldvlh46sxzv5514rpzm809vxn594vd7y25by5lif";
      };

      beamDeps = [];
    };

    eternal = buildMix rec {
      name = "eternal";
      version = "1.2.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "10p7m6kv2z2c16gw36wgiwnkykss4lfkmm71llxp09ipkhmy77rc";
      };

      beamDeps = [];
    };

    ex_cldr = buildMix rec {
      name = "ex_cldr";
      version = "2.23.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0ivk9hwr0hbv5yh04gyp7crwbxx2qkcr219r094jlqp22lqsv7bw";
      };

      beamDeps = [ certifi cldr_utils decimal gettext jason nimble_parsec plug telemetry ];
    };

    ex_doc = buildMix rec {
      name = "ex_doc";
      version = "0.24.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1nmpdxydbc1khcayab98gfv7km2qrqmgp1s64kjdkf11x3cy2d71";
      };

      beamDeps = [ earmark_parser makeup_elixir makeup_erlang ];
    };

    flexto = buildMix rec {
      name = "flexto";
      version = "0.2.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "06v8qv9is2wr3by53micq1g810w16sjlimh88jyf4k6w9idqghd3";
      };

      beamDeps = [ ecto ];
    };

    gettext = buildMix rec {
      name = "gettext";
      version = "0.18.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1igmn69xzj5wpkblg3k9v7wa2fjc2j0cncwx0grk1pag7nqkgxgr";
      };

      beamDeps = [];
    };

    hackney = buildRebar3 rec {
      name = "hackney";
      version = "1.17.4";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "05kbk3rpw2j3cb9pybikydxmi2nm5pidpx0jsm48av2mjr4zy5ny";
      };

      beamDeps = [ certifi idna metrics mimerl parse_trans ssl_verify_fun unicode_util_compat ];
    };

    httpoison = buildMix rec {
      name = "httpoison";
      version = "1.5.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "19597c6s4ppnn72ciigvasdk71szp4m4j83r60lrxarzlsp99ng9";
      };

      beamDeps = [ hackney ];
    };

    idna = buildRebar3 rec {
      name = "idna";
      version = "6.1.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1sjcjibl34sprpf1dgdmzfww24xlyy34lpj7mhcys4j4i6vnwdwj";
      };

      beamDeps = [ unicode_util_compat ];
    };

    jason = buildMix rec {
      name = "jason";
      version = "1.2.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0y91s7q8zlfqd037c1mhqdhrvrf60l4ax7lzya1y33h5y3sji8hq";
      };

      beamDeps = [ decimal ];
    };

    jumper = buildMix rec {
      name = "jumper";
      version = "1.0.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0cvlbfkapkvbwaijmjq3cxg5m6yv4rh69wvss9kfj862i83mk31i";
      };

      beamDeps = [];
    };

    junit_formatter = buildMix rec {
      name = "junit_formatter";
      version = "3.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1x3j7gbv2sk0mvjgrxcnbnnzq5lsiykdvazzfx7zq4gpjcd40lns";
      };

      beamDeps = [];
    };

    makeup = buildMix rec {
      name = "makeup";
      version = "1.0.5";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1a9cp9zp85yfybhdxapi9haa1yykzq91bw8abmk0qp1z5p05i8fg";
      };

      beamDeps = [ nimble_parsec ];
    };

    makeup_elixir = buildMix rec {
      name = "makeup_elixir";
      version = "0.15.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1j3fdjp915nq44c55gwysscryyqivjnaaign0wman1sb4drw2s6v";
      };

      beamDeps = [ makeup nimble_parsec ];
    };

    makeup_erlang = buildMix rec {
      name = "makeup_erlang";
      version = "0.1.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1fvw0zr7vqd94vlj62xbqh0yrih1f7wwnmlj62rz0klax44hhk8p";
      };

      beamDeps = [ makeup ];
    };

    metrics = buildRebar3 rec {
      name = "metrics";
      version = "1.0.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "05lz15piphyhvvm3d1ldjyw0zsrvz50d2m5f2q3s8x2gvkfrmc39";
      };

      beamDeps = [];
    };

    mime = buildMix rec {
      name = "mime";
      version = "1.6.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "19qrpnmaf3w8bblvkv6z5g82hzd10rhc7bqxvqyi88c37xhsi89i";
      };

      beamDeps = [];
    };

    mimerl = buildRebar3 rec {
      name = "mimerl";
      version = "1.2.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "08wkw73dy449n68ssrkz57gikfzqk3vfnf264s31jn5aa1b5hy7j";
      };

      beamDeps = [];
    };

    mox = buildMix rec {
      name = "mox";
      version = "1.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1pzlqq9y4i9i7d0dm8ah2c5a7y2h9649gkz9hfqamnmbnwh0l6r0";
      };

      beamDeps = [];
    };

    mutex = buildMix rec {
      name = "mutex";
      version = "1.1.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0gpzqd0mq6q8wgwmnk69qv4y7pz8nmrp0lnx4cf63lmdhhkvk0rb";
      };

      beamDeps = [];
    };

    nimble_parsec = buildMix rec {
      name = "nimble_parsec";
      version = "1.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0jzmr0x3s6z16c74gvrk9aqc10brn6a1dwa8ywzr2vkhdgb35sq8";
      };

      beamDeps = [];
    };

    oban = buildMix rec {
      name = "oban";
      version = "2.8.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0wx5009rwj3a2bs9ffsq81i9dqkh7bfs6wh7ghhw8z4g86na4m19";
      };

      beamDeps = [ ecto_sql jason postgrex telemetry ];
    };

    parse_trans = buildRebar3 rec {
      name = "parse_trans";
      version = "3.3.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "12w8ai6b5s6b4hnvkav7hwxd846zdd74r32f84nkcmjzi1vrbk87";
      };

      beamDeps = [];
    };

    phoenix = buildMix rec {
      name = "phoenix";
      version = "1.5.8";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0mfr691wb95ym4jj2jfrph0x5k1fha43phxnga61cdj85yix1pim";
      };

      beamDeps = [ jason phoenix_html phoenix_pubsub plug plug_cowboy plug_crypto telemetry ];
    };

    phoenix_ecto = buildMix rec {
      name = "phoenix_ecto";
      version = "4.2.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1h23fy3pylaszh3l2zafq1a7fjwlwb3yw7dy09p0mb4wi6p1p2j7";
      };

      beamDeps = [ ecto phoenix_html plug ];
    };

    phoenix_html = buildMix rec {
      name = "phoenix_html";
      version = "2.14.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "03z8r285znlg25yi47d4l59s7jq58y4dnhvbxgp16npkzykrgmpg";
      };

      beamDeps = [ plug ];
    };

    phoenix_live_dashboard = buildMix rec {
      name = "phoenix_live_dashboard";
      version = "0.2.10";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0s291fziphdf9qxxdbphn6wd2id1ccxv666z2l7m6q4aan6rahcq";
      };

      beamDeps = [ phoenix_html phoenix_live_view telemetry_metrics ];
    };

    phoenix_live_view = buildMix rec {
      name = "phoenix_live_view";
      version = "0.14.8";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1690gay6p48wb2lg7s2ip386p73dx11h910vzn2gx9hkq6yn15l8";
      };

      beamDeps = [ jason phoenix phoenix_html telemetry ];
    };

    phoenix_pubsub = buildMix rec {
      name = "phoenix_pubsub";
      version = "2.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0wgpa19l6xar0k2m117iz2kq3cw433llp07sqswpf5969y698bf5";
      };

      beamDeps = [];
    };

    plug = buildMix rec {
      name = "plug";
      version = "1.11.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "07w83cx4xx90x4l1kmil4lpby55lpw83jfw3y08pqn5vxx7lwli3";
      };

      beamDeps = [ mime plug_crypto telemetry ];
    };

    plug_cowboy = buildMix rec {
      name = "plug_cowboy";
      version = "2.5.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "06p7rmx01fknkf0frvjjaqs3qsz6066aa41qyd378n72lljqjb2v";
      };

      beamDeps = [ cowboy cowboy_telemetry plug telemetry ];
    };

    plug_crypto = buildMix rec {
      name = "plug_crypto";
      version = "1.2.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1nxnxj62iv4yvm4771jbxpj3l4brn2crz053y12s998lv5x1qqw7";
      };

      beamDeps = [];
    };

    pointers = buildMix rec {
      name = "pointers";
      version = "0.5.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "12l15qzm7hc68lfkddbr90ka2rmyl9crn0kbid88l00izasivs0f";
      };

      beamDeps = [ ecto_sql flexto pointers_ulid ];
    };

    pointers_ulid = buildMix rec {
      name = "pointers_ulid";
      version = "0.2.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0nyysgz5r1ax1355jmfpj76a10nfsx026xih141j5bx9jb46gjjw";
      };

      beamDeps = [ ecto ecto_sql ];
    };

    poison = buildMix rec {
      name = "poison";
      version = "4.0.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "098gdz7xzfmnjzgnnv80nl4h3zl8l9czqqd132vlnfabxbz3d25s";
      };

      beamDeps = [];
    };

    polyjuice_client = buildMix rec {
      name = "polyjuice_client";
      version = "0.2.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "08vrgfjwgn62p4b7pbk8lcnn3b89r47mk3rlvq40v2agj4fd7d5x";
      };

      beamDeps = [ hackney poison polyjuice_util ];
    };

    polyjuice_util = buildMix rec {
      name = "polyjuice_util";
      version = "0.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1md8356fi0sf3cnxb6cx4zdbybcs4i4pqnhzkajivkjj9xhiypdg";
      };

      beamDeps = [];
    };

    postgrex = buildMix rec {
      name = "postgrex";
      version = "0.15.10";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1gijc67mnxi80vsxgsw4rpdircx3w4x670g2z09v5xj2fm1clq0m";
      };

      beamDeps = [ connection db_connection decimal jason ];
    };

    ranch = buildRebar3 rec {
      name = "ranch";
      version = "1.7.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1my7mz3x7a1fmjyin55nn1fr2d2rl3y64qf3kpcidxvxg0kqa7a5";
      };

      beamDeps = [];
    };

    sleeplocks = buildRebar3 rec {
      name = "sleeplocks";
      version = "1.1.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1q823i5bisc83pyssgrqkggyxiasm7b8dygzj2r943adzyp3gvl4";
      };

      beamDeps = [];
    };

    ssl_verify_fun = buildRebar3 rec {
      name = "ssl_verify_fun";
      version = "1.1.6";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1026l1z1jh25z8bfrhaw0ryk5gprhrpnirq877zqhg253x3x5c5x";
      };

      beamDeps = [];
    };

    telemetry = buildRebar3 rec {
      name = "telemetry";
      version = "0.4.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0hc0fr2bh97wah9ycpm7hb5jdqr5hnl1s3b2ibbbx9gxbwvbhwpb";
      };

      beamDeps = [];
    };

    telemetry_metrics = buildMix rec {
      name = "telemetry_metrics";
      version = "0.6.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0gawj416w0fpc6vpz3c6xbbaw7z9rqhl791aa4skh92b8snngzjw";
      };

      beamDeps = [ telemetry ];
    };

    telemetry_poller = buildRebar3 rec {
      name = "telemetry_poller";
      version = "0.5.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1m1zcq65yz0wp1wx7mcy2iq37cyizbzrmv0c11x6xg0hj8375asc";
      };

      beamDeps = [ telemetry ];
    };

    tesla = buildMix rec {
      name = "tesla";
      version = "1.4.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "06i0rshkm1byzgsphbr3al4hns7bcrpl1rxy8lwlp31cj8sxxxcm";
      };

      beamDeps = [ hackney jason mime poison telemetry ];
    };

    timex = buildMix rec {
      name = "timex";
      version = "3.7.5";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1r3l50p8f8mxgghh079v1y5g02kzqr15ijbi7mkfzwl0lvf0hmm1";
      };

      beamDeps = [ combine gettext tzdata ];
    };

    tzdata = buildMix rec {
      name = "tzdata";
      version = "1.0.5";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0nia83zpk0pb4jkpvhkmmgw8i5p6kd6cf776q6aj0pcym6i9llam";
      };

      beamDeps = [ hackney ];
    };

    unicode_util_compat = buildRebar3 rec {
      name = "unicode_util_compat";
      version = "0.7.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "08952lw8cjdw8w171lv8wqbrxc4rcmb3jhkrdb7n06gngpbfdvi5";
      };

      beamDeps = [];
    };

    unsafe = buildMix rec {
      name = "unsafe";
      version = "1.0.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1rahpgz1lsd66r7ycns1ryz2qymamz1anrlps986900lsai2jxvc";
      };

      beamDeps = [];
    };

    uuid = buildMix rec {
      name = "uuid";
      version = "1.1.8";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1b7jjbkmp42rayl6nif6qirksnxgxzksm2rpq9fiyq1v9hxmk467";
      };

      beamDeps = [];
    };
  };
in self

