  


<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# githubog: http://ogp.me/ns/fb/githubog#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>country_select/lib/country_select.rb at master · chrislerum/country_select</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="apple-touch-icon-114.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="apple-touch-icon-114.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="apple-touch-icon-144.png" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="apple-touch-icon-144.png" />
    <link rel="logo" type="image/svg" href="http://github-media-downloads.s3.amazonaws.com/github-logo.svg" />
    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">

    
    
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />

    <meta content="authenticity_token" name="csrf-param" />
<meta content="rFYXqfGbrzfAGqSvIYy7m0r3VjlZ15CXbOpNdZWwrEE=" name="csrf-token" />

    <link href="https://a248.e.akamai.net/assets.github.com/assets/github-4987a0cc96fcd4f24924425cfce8bdcbdc086ac7.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="https://a248.e.akamai.net/assets.github.com/assets/github2-966ebd86426073c75fc9d6bdc387282c05baab84.css" media="screen" rel="stylesheet" type="text/css" />
    


        <script src="https://a248.e.akamai.net/assets.github.com/assets/frameworks-995182d02a0effa06cdc51e33fe6e729014a3c91.js" type="text/javascript"></script>
      <script src="https://a248.e.akamai.net/assets.github.com/assets/github-6eebb5289514c862341aa9cb1d678a9cf3a2bafc.js" type="text/javascript"></script>
      

        <link rel='permalink' href='/chrislerum/country_select/blob/b2ed68e756e040000c0041814de043fa5e74bd39/lib/country_select.rb'>
    <meta property="og:title" content="country_select"/>
    <meta property="og:type" content="githubog:gitrepository"/>
    <meta property="og:url" content="https://github.com/chrislerum/country_select"/>
    <meta property="og:image" content="https://secure.gravatar.com/avatar/24f5236d61d47707df96e6e658703d5d?s=420&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"/>
    <meta property="og:site_name" content="GitHub"/>
    <meta property="og:description" content="Country Select Plugin. Contribute to country_select development by creating an account on GitHub."/>
    <meta property="twitter:card" content="summary"/>
    <meta property="twitter:site" content="@GitHub">
    <meta property="twitter:title" content="chrislerum/country_select"/>

    <meta name="description" content="Country Select Plugin. Contribute to country_select development by creating an account on GitHub." />

      <meta name="robots" content="noindex, nofollow">
  <link href="https://github.com/chrislerum/country_select/commits/master.atom" rel="alternate" title="Recent Commits to country_select:master" type="application/atom+xml" />

  </head>


  <body class="logged_in page-blob macintosh vis-public fork env-production ">
    <div id="wrapper">

      

      

      


        <div class="header header-logged-in true">
          <div class="container clearfix">

            <a class="header-logo-blacktocat" href="https://github.com/">
  <span class="mega-icon mega-icon-blacktocat"></span>
</a>

            <div class="divider-vertical"></div>

              <a href="/notifications" class="notification-indicator tooltipped downwards" title="You have no unread notifications">
    <span class="mail-status all-read"></span>
  </a>
  <div class="divider-vertical"></div>


              <div class="topsearch command-bar-activated ">
  <form accept-charset="UTF-8" action="/search" class="command_bar_form" id="top_search_form" method="get">
  <a href="/search/advanced" class="advanced-search-icon tooltipped downwards command-bar-search" id="advanced_search" title="Advanced search"><span class="mini-icon mini-icon-advanced-search "></span></a>

  <input type="text" name="q" id="command-bar" placeholder="Search or type a command" tabindex="1" data-username="salcoin" autocapitalize="off">

  <span class="mini-icon help tooltipped downwards" title="Show command bar help">
    <span class="mini-icon mini-icon-help"></span>
  </span>

  <input type="hidden" name="ref" value="commandbar">

  <div class="divider-vertical"></div>
</form>
  <ul class="top-nav">
      <li class="explore"><a href="https://github.com/explore">Explore</a></li>
      <li><a href="https://gist.github.com">Gist</a></li>
      <li><a href="/blog">Blog</a></li>
    <li><a href="http://help.github.com">Help</a></li>
  </ul>
</div>


            

  
    <ul id="user-links">
      <li>
        <a href="https://github.com/salcoin" class="name">
          <img height="20" src="https://secure.gravatar.com/avatar/cdb3bae4c75a90ef5dc9275de0bdc57b?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /> salcoin
        </a>
      </li>
      <li>
        <a href="/new" id="new_repo" class="tooltipped downwards" title="Create a new repo">
          <span class="mini-icon mini-icon-create"></span>
        </a>
      </li>
      <li>
        <a href="/settings/profile" id="account_settings"
          class="tooltipped downwards"
          title="Account settings ">
          <span class="mini-icon mini-icon-account-settings"></span>
        </a>
      </li>
      <li>
          <a href="/logout" data-method="post" id="logout" class="tooltipped downwards" title="Sign out">
            <span class="mini-icon mini-icon-logout"></span>
          </a>
      </li>
    </ul>



            
          </div>
        </div>


      

      


            <div class="site hfeed" itemscope itemtype="http://schema.org/WebPage">
      <div class="hentry">
        
        <div class="pagehead repohead instapaper_ignore readability-menu">
          <div class="container">
            <div class="title-actions-bar">
              


                  <ul class="pagehead-actions">

          <li class="subscription">
              <form accept-charset="UTF-8" action="/notifications/subscribe" data-autosubmit="true" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="authenticity_token" type="hidden" value="rFYXqfGbrzfAGqSvIYy7m0r3VjlZ15CXbOpNdZWwrEE=" /></div>  <input id="repository_id" name="repository_id" type="hidden" value="1319292" />
  <div class="context-menu-container js-menu-container js-context-menu">
    <span class="minibutton switcher bigger js-menu-target">
      <span class="js-context-button">
          <span class="mini-icon mini-icon-watching"></span>Watch
      </span>
    </span>

    <div class="context-pane js-menu-content">
      <a href="#" class="close js-menu-close"><span class="mini-icon mini-icon-remove-close"></span></a>
      <div class="context-title">Notification status</div>

      <div class="context-body pane-selector">
        <ul class="js-navigation-container">
          <li class="selector-item js-navigation-item js-navigation-target selected">
            <span class="mini-icon mini-icon-confirm"></span>
            <label>
              <input checked="checked" id="do_included" name="do" type="radio" value="included" />
              <h4>Not watching</h4>
              <p>You will only receive notifications when you participate or are mentioned.</p>
            </label>
            <span class="context-button-text js-context-button-text">
              <span class="mini-icon mini-icon-watching"></span>
              Watch
            </span>
          </li>
          <li class="selector-item js-navigation-item js-navigation-target ">
            <span class="mini-icon mini-icon-confirm"></span>
            <label>
              <input id="do_subscribed" name="do" type="radio" value="subscribed" />
              <h4>Watching</h4>
              <p>You will receive all notifications for this repository.</p>
            </label>
            <span class="context-button-text js-context-button-text">
              <span class="mini-icon mini-icon-unwatch"></span>
              Unwatch
            </span>
          </li>
          <li class="selector-item js-navigation-item js-navigation-target ">
            <span class="mini-icon mini-icon-confirm"></span>
            <label>
              <input id="do_ignore" name="do" type="radio" value="ignore" />
              <h4>Ignored</h4>
              <p>You will not receive notifications for this repository.</p>
            </label>
            <span class="context-button-text js-context-button-text">
              <span class="mini-icon mini-icon-mute"></span>
              Stop ignoring
            </span>
          </li>
        </ul>
      </div>
    </div>
  </div>
</form>
          </li>

          <li class="js-toggler-container js-social-container starring-container ">
            <a href="/chrislerum/country_select/unstar" class="minibutton js-toggler-target starred" data-remote="true" data-method="post" rel="nofollow">
              <span class="mini-icon mini-icon-star"></span>Unstar
            </a><a href="/chrislerum/country_select/star" class="minibutton js-toggler-target unstarred" data-remote="true" data-method="post" rel="nofollow">
              <span class="mini-icon mini-icon-star"></span>Star
            </a><a class="social-count js-social-count" href="/chrislerum/country_select/stargazers">75</a>
          </li>

              <li>
                <a href="/chrislerum/country_select/fork_select" class="minibutton js-toggler-target lighter" rel="facebox nofollow"><span class="mini-icon mini-icon-fork"></span>Fork</a><a href="/chrislerum/country_select/network" class="social-count">87</a>
              </li>


    </ul>

              <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
                <span class="repo-label"><span>public</span></span>
                <span class="mega-icon mega-icon-repo-forked"></span>
                <span class="author vcard">
                  <a href="/chrislerum" class="url fn" itemprop="url" rel="author">
                  <span itemprop="title">chrislerum</span>
                  </a></span> /
                <strong><a href="/chrislerum/country_select" class="js-current-repository">country_select</a></strong>
                  <span class="fork-flag">
                    <span class="text">forked from <a href="/rails/country_select">rails/country_select</a></span>
                  </span>
              </h1>
            </div>

            

  <ul class="tabs">
    <li><a href="/chrislerum/country_select" class="selected" highlight="repo_sourcerepo_downloadsrepo_commitsrepo_tagsrepo_branches">Code</a></li>
    <li><a href="/chrislerum/country_select/network" highlight="repo_network">Network</a></li>
    <li><a href="/chrislerum/country_select/pulls" highlight="repo_pulls">Pull Requests <span class='counter'>0</span></a></li>


      <li><a href="/chrislerum/country_select/wiki" highlight="repo_wiki">Wiki</a></li>


    <li><a href="/chrislerum/country_select/graphs" highlight="repo_graphsrepo_contributors">Graphs</a></li>


  </ul>
  
<div class="tabnav">

  <span class="tabnav-right">
    <ul class="tabnav-tabs">
          <li><a href="/chrislerum/country_select/tags" class="tabnav-tab" highlight="repo_tags">Tags <span class="counter blank">0</span></a></li>
    </ul>
    
  </span>

  <div class="tabnav-widget scope">


    <div class="select-menu js-menu-container js-select-menu js-branch-menu">
      <a class="minibutton select-menu-button js-menu-target" data-hotkey="w" data-ref="master">
        <span class="mini-icon mini-icon-branch"></span>
        <i>branch:</i>
        <span class="js-select-button">master</span>
      </a>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container js-select-menu-pane">

        <div class="select-menu-modal js-select-menu-pane">
          <div class="select-menu-header">
            <span class="select-menu-title">Switch branches/tags</span>
            <span class="mini-icon mini-icon-remove-close js-menu-close"></span>
          </div> <!-- /.select-menu-header -->

          <div class="select-menu-filters">
            <div class="select-menu-text-filter">
              <input type="text" id="commitish-filter-field" class="js-select-menu-text-filter js-filterable-field js-navigation-enable" placeholder="Find or create a branch…">
            </div> <!-- /.select-menu-text-filter -->
            <div class="select-menu-tabs">
              <ul>
                <li class="select-menu-tab">
                  <a href="#" data-filter="branches" class="js-select-menu-tab selected">Branches</a>
                </li>
                <li class="select-menu-tab">
                  <a href="#" data-filter="tags" class="js-select-menu-tab">Tags</a>
                </li>
              </ul>
            </div><!-- /.select-menu-tabs -->
          </div><!-- /.select-menu-filters -->

          <div class="select-menu-list js-filter-tab js-filter-branches" data-filterable-for="commitish-filter-field" data-filterable-type="substring">



              <div class="select-menu-item js-navigation-item js-navigation-target selected">
                <span class="select-menu-checkmark mini-icon mini-icon-confirm"></span>

                    <a href="/chrislerum/country_select/blob/master/lib/country_select.rb" class="js-navigation-open select-menu-item-text js-select-button-text" data-name="master" rel="nofollow">master</a>

              </div> <!-- /.select-menu-item -->


              <div class="select-menu-no-results js-not-filterable">Nothing to show</div>
          </div> <!-- /.select-menu-list -->


          <div class="select-menu-list js-filter-tab js-filter-tags" data-filterable-for="commitish-filter-field" data-filterable-type="substring" style="display:none;">


            <div class="select-menu-no-results js-not-filterable">Nothing to show</div>

          </div> <!-- /.select-menu-list -->

        </div> <!-- /.select-menu-modal -->
      </div> <!-- /.select-menu-modal-holder -->
    </div> <!-- /.select-menu -->

  </div> <!-- /.scope -->

  <ul class="tabnav-tabs">
    <li><a href="/chrislerum/country_select" class="selected tabnav-tab" highlight="repo_source">Files</a></li>
    <li><a href="/chrislerum/country_select/commits/master" class="tabnav-tab" highlight="repo_commits">Commits</a></li>
    <li><a href="/chrislerum/country_select/branches" class="tabnav-tab" highlight="repo_branches" rel="nofollow">Branches <span class="counter ">1</span></a></li>
  </ul>

</div>

  
  
  


            
          </div>
        </div><!-- /.repohead -->

        <div id="js-repo-pjax-container" class="container context-loader-container" data-pjax-container>
          


<!-- blob contrib key: blob_contributors:v21:94ccf3022c8a8fd9180685daeaed3d5e -->
<!-- blob contrib frag key: views10/v8/blob_contributors:v21:94ccf3022c8a8fd9180685daeaed3d5e -->

<div id="slider">
    <div class="frame-meta">

      <p title="This is a placeholder element" class="js-history-link-replace hidden"></p>
      <div class="breadcrumb">
        <span class='bold'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/chrislerum/country_select" class="js-slide-to" data-direction="back" itemscope="url"><span itemprop="title">country_select</span></a></span></span> / <span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/chrislerum/country_select/tree/master/lib" class="js-slide-to" data-direction="back" itemscope="url"><span itemprop="title">lib</span></a></span> / <strong class="final-path">country_select.rb</strong> <span class="js-zeroclipboard zeroclipboard-button" data-clipboard-text="lib/country_select.rb" data-copied-hint="copied!" title="copy to clipboard"><span class="mini-icon mini-icon-clipboard"></span></span>
      </div>

      <a href="/chrislerum/country_select/find/master" class="js-slide-to" data-hotkey="t" style="display:none">Show File Finder</a>

        
  <div class="commit file-history-tease">
    <img class="main-avatar" height="24" src="https://secure.gravatar.com/avatar/523e52a9e4ca89935f8fab394144c93e?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
    <span class="author"><a href="/duff" rel="author">duff</a></span>
    <time class="js-relative-date" datetime="2012-05-22T07:45:36-07:00" title="2012-05-22 07:45:36">May 22, 2012</time>
    <div class="commit-title">
        <a href="/chrislerum/country_select/commit/b2ed68e756e040000c0041814de043fa5e74bd39" class="message">"Taiwan, Province of China" =&gt; "Taiwan"</a>
    </div>

    <div class="participation">
      <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>3</strong> contributors</a></p>
          <a class="avatar tooltipped downwards" title="NZKoz" href="/chrislerum/country_select/commits/master/lib/country_select.rb?author=NZKoz"><img height="20" src="https://secure.gravatar.com/avatar/efa76b164a7de4a5730e4fa397cc4425?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>
    <a class="avatar tooltipped downwards" title="duff" href="/chrislerum/country_select/commits/master/lib/country_select.rb?author=duff"><img height="20" src="https://secure.gravatar.com/avatar/523e52a9e4ca89935f8fab394144c93e?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>
    <a class="avatar tooltipped downwards" title="yyyc514" href="/chrislerum/country_select/commits/master/lib/country_select.rb?author=yyyc514"><img height="20" src="https://secure.gravatar.com/avatar/fab2e0c720d6e979a551782631dca58e?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>


    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2>Users on GitHub who have contributed to this file</h2>
      <ul class="facebox-user-list">
        <li>
          <img height="24" src="https://secure.gravatar.com/avatar/efa76b164a7de4a5730e4fa397cc4425?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/NZKoz">NZKoz</a>
        </li>
        <li>
          <img height="24" src="https://secure.gravatar.com/avatar/523e52a9e4ca89935f8fab394144c93e?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/duff">duff</a>
        </li>
        <li>
          <img height="24" src="https://secure.gravatar.com/avatar/fab2e0c720d6e979a551782631dca58e?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/yyyc514">yyyc514</a>
        </li>
      </ul>
    </div>
  </div>


    </div><!-- ./.frame-meta -->

    <div class="frames">
      <div class="frame" data-permalink-url="/chrislerum/country_select/blob/b2ed68e756e040000c0041814de043fa5e74bd39/lib/country_select.rb" data-title="country_select/lib/country_select.rb at master · chrislerum/country_select · GitHub" data-type="blob">

        <div id="files" class="bubble">
          <div class="file">
            <div class="meta">
              <div class="info">
                <span class="icon"><b class="mini-icon mini-icon-text-file"></b></span>
                <span class="mode" title="File Mode">file</span>
                  <span>89 lines (84 sloc)</span>
                <span>6.366 kb</span>
              </div>
              <ul class="button-group actions">
                  <li>
                        <a class="grouped-button minibutton bigger lighter tooltipped leftwards"
                           title="Clicking this button will automatically fork this project so you can edit the file"
                           href="/chrislerum/country_select/edit/master/lib/country_select.rb"
                           data-method="post" rel="nofollow">Edit</a>
                  </li>
                <li><a href="/chrislerum/country_select/raw/master/lib/country_select.rb" class="button minibutton grouped-button bigger lighter" id="raw-url">Raw</a></li>
                  <li><a href="/chrislerum/country_select/blame/master/lib/country_select.rb" class="button minibutton grouped-button bigger lighter">Blame</a></li>
                <li><a href="/chrislerum/country_select/commits/master/lib/country_select.rb" class="button minibutton grouped-button bigger lighter" rel="nofollow">History</a></li>
              </ul>

            </div>
                <div class="data type-ruby js-blob-data">
      <table cellpadding="0" cellspacing="0" class="lines">
        <tr>
          <td>
            <pre class="line_numbers"><span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>
<span id="L42" rel="#L42">42</span>
<span id="L43" rel="#L43">43</span>
<span id="L44" rel="#L44">44</span>
<span id="L45" rel="#L45">45</span>
<span id="L46" rel="#L46">46</span>
<span id="L47" rel="#L47">47</span>
<span id="L48" rel="#L48">48</span>
<span id="L49" rel="#L49">49</span>
<span id="L50" rel="#L50">50</span>
<span id="L51" rel="#L51">51</span>
<span id="L52" rel="#L52">52</span>
<span id="L53" rel="#L53">53</span>
<span id="L54" rel="#L54">54</span>
<span id="L55" rel="#L55">55</span>
<span id="L56" rel="#L56">56</span>
<span id="L57" rel="#L57">57</span>
<span id="L58" rel="#L58">58</span>
<span id="L59" rel="#L59">59</span>
<span id="L60" rel="#L60">60</span>
<span id="L61" rel="#L61">61</span>
<span id="L62" rel="#L62">62</span>
<span id="L63" rel="#L63">63</span>
<span id="L64" rel="#L64">64</span>
<span id="L65" rel="#L65">65</span>
<span id="L66" rel="#L66">66</span>
<span id="L67" rel="#L67">67</span>
<span id="L68" rel="#L68">68</span>
<span id="L69" rel="#L69">69</span>
<span id="L70" rel="#L70">70</span>
<span id="L71" rel="#L71">71</span>
<span id="L72" rel="#L72">72</span>
<span id="L73" rel="#L73">73</span>
<span id="L74" rel="#L74">74</span>
<span id="L75" rel="#L75">75</span>
<span id="L76" rel="#L76">76</span>
<span id="L77" rel="#L77">77</span>
<span id="L78" rel="#L78">78</span>
<span id="L79" rel="#L79">79</span>
<span id="L80" rel="#L80">80</span>
<span id="L81" rel="#L81">81</span>
<span id="L82" rel="#L82">82</span>
<span id="L83" rel="#L83">83</span>
<span id="L84" rel="#L84">84</span>
<span id="L85" rel="#L85">85</span>
<span id="L86" rel="#L86">86</span>
<span id="L87" rel="#L87">87</span>
<span id="L88" rel="#L88">88</span>
</pre>
          </td>
          <td width="100%">
                  <div class="highlight"><pre><div class='line' id='LC1'><span class="c1"># CountrySelect</span></div><div class='line' id='LC2'><span class="k">module</span> <span class="nn">ActionView</span></div><div class='line' id='LC3'>&nbsp;&nbsp;<span class="k">module</span> <span class="nn">Helpers</span></div><div class='line' id='LC4'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">module</span> <span class="nn">FormOptionsHelper</span></div><div class='line' id='LC5'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Return select and option tags for the given object and method, using country_options_for_select to generate the list of option tags.</span></div><div class='line' id='LC6'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">country_select</span><span class="p">(</span><span class="n">object</span><span class="p">,</span> <span class="nb">method</span><span class="p">,</span> <span class="n">priority_countries</span> <span class="o">=</span> <span class="kp">nil</span><span class="p">,</span> <span class="n">options</span> <span class="o">=</span> <span class="p">{},</span> <span class="n">html_options</span> <span class="o">=</span> <span class="p">{})</span></div><div class='line' id='LC7'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="no">InstanceTag</span><span class="o">.</span><span class="n">new</span><span class="p">(</span><span class="n">object</span><span class="p">,</span> <span class="nb">method</span><span class="p">,</span> <span class="nb">self</span><span class="p">,</span> <span class="n">options</span><span class="o">.</span><span class="n">delete</span><span class="p">(</span><span class="ss">:object</span><span class="p">))</span><span class="o">.</span><span class="n">to_country_select_tag</span><span class="p">(</span><span class="n">priority_countries</span><span class="p">,</span> <span class="n">options</span><span class="p">,</span> <span class="n">html_options</span><span class="p">)</span></div><div class='line' id='LC8'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC9'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Returns a string of option tags for pretty much any country in the world. Supply a country name as +selected+ to</span></div><div class='line' id='LC10'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># have it marked as the selected option tag. You can also supply an array of countries as +priority_countries+, so</span></div><div class='line' id='LC11'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># that they will be listed above the rest of the (long) list.</span></div><div class='line' id='LC12'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#</span></div><div class='line' id='LC13'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># NOTE: Only the option tags are returned, you have to wrap this call in a regular HTML select tag.</span></div><div class='line' id='LC14'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">country_options_for_select</span><span class="p">(</span><span class="n">selected</span> <span class="o">=</span> <span class="kp">nil</span><span class="p">,</span> <span class="n">priority_countries</span> <span class="o">=</span> <span class="kp">nil</span><span class="p">)</span></div><div class='line' id='LC15'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">country_options</span> <span class="o">=</span> <span class="s2">&quot;&quot;</span></div><div class='line' id='LC16'><br/></div><div class='line' id='LC17'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="n">priority_countries</span></div><div class='line' id='LC18'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">country_options</span> <span class="o">+=</span> <span class="n">options_for_select</span><span class="p">(</span><span class="n">priority_countries</span><span class="p">,</span> <span class="n">selected</span><span class="p">)</span></div><div class='line' id='LC19'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">country_options</span> <span class="o">+=</span> <span class="s2">&quot;&lt;option value=</span><span class="se">\&quot;\&quot;</span><span class="s2"> disabled=</span><span class="se">\&quot;</span><span class="s2">disabled</span><span class="se">\&quot;</span><span class="s2">&gt;-------------&lt;/option&gt;</span><span class="se">\n</span><span class="s2">&quot;</span></div><div class='line' id='LC20'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># prevents selected from being included twice in the HTML which causes</span></div><div class='line' id='LC21'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># some browsers to select the second selected option (not priority)</span></div><div class='line' id='LC22'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># which makes it harder to select an alternative priority country</span></div><div class='line' id='LC23'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">selected</span><span class="o">=</span><span class="kp">nil</span> <span class="k">if</span> <span class="n">priority_countries</span><span class="o">.</span><span class="n">include?</span><span class="p">(</span><span class="n">selected</span><span class="p">)</span></div><div class='line' id='LC24'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC25'><br/></div><div class='line' id='LC26'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="n">country_options</span> <span class="o">+</span> <span class="n">options_for_select</span><span class="p">(</span><span class="no">COUNTRIES</span><span class="p">,</span> <span class="n">selected</span><span class="p">)</span></div><div class='line' id='LC27'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC28'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># All the countries included in the country_options output.</span></div><div class='line' id='LC29'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="no">COUNTRIES</span> <span class="o">=</span> <span class="o">[</span><span class="s2">&quot;Afghanistan&quot;</span><span class="p">,</span> <span class="s2">&quot;Aland Islands&quot;</span><span class="p">,</span> <span class="s2">&quot;Albania&quot;</span><span class="p">,</span> <span class="s2">&quot;Algeria&quot;</span><span class="p">,</span> <span class="s2">&quot;American Samoa&quot;</span><span class="p">,</span> <span class="s2">&quot;Andorra&quot;</span><span class="p">,</span> <span class="s2">&quot;Angola&quot;</span><span class="p">,</span></div><div class='line' id='LC30'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Anguilla&quot;</span><span class="p">,</span> <span class="s2">&quot;Antarctica&quot;</span><span class="p">,</span> <span class="s2">&quot;Antigua And Barbuda&quot;</span><span class="p">,</span> <span class="s2">&quot;Argentina&quot;</span><span class="p">,</span> <span class="s2">&quot;Armenia&quot;</span><span class="p">,</span> <span class="s2">&quot;Aruba&quot;</span><span class="p">,</span> <span class="s2">&quot;Australia&quot;</span><span class="p">,</span> <span class="s2">&quot;Austria&quot;</span><span class="p">,</span></div><div class='line' id='LC31'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Azerbaijan&quot;</span><span class="p">,</span> <span class="s2">&quot;Bahamas&quot;</span><span class="p">,</span> <span class="s2">&quot;Bahrain&quot;</span><span class="p">,</span> <span class="s2">&quot;Bangladesh&quot;</span><span class="p">,</span> <span class="s2">&quot;Barbados&quot;</span><span class="p">,</span> <span class="s2">&quot;Belarus&quot;</span><span class="p">,</span> <span class="s2">&quot;Belgium&quot;</span><span class="p">,</span> <span class="s2">&quot;Belize&quot;</span><span class="p">,</span> <span class="s2">&quot;Benin&quot;</span><span class="p">,</span></div><div class='line' id='LC32'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Bermuda&quot;</span><span class="p">,</span> <span class="s2">&quot;Bhutan&quot;</span><span class="p">,</span> <span class="s2">&quot;Bolivia&quot;</span><span class="p">,</span> <span class="s2">&quot;Bosnia and Herzegowina&quot;</span><span class="p">,</span> <span class="s2">&quot;Botswana&quot;</span><span class="p">,</span> <span class="s2">&quot;Bouvet Island&quot;</span><span class="p">,</span> <span class="s2">&quot;Brazil&quot;</span><span class="p">,</span></div><div class='line' id='LC33'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;British Indian Ocean Territory&quot;</span><span class="p">,</span> <span class="s2">&quot;Brunei Darussalam&quot;</span><span class="p">,</span> <span class="s2">&quot;Bulgaria&quot;</span><span class="p">,</span> <span class="s2">&quot;Burkina Faso&quot;</span><span class="p">,</span> <span class="s2">&quot;Burundi&quot;</span><span class="p">,</span> <span class="s2">&quot;Cambodia&quot;</span><span class="p">,</span></div><div class='line' id='LC34'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Cameroon&quot;</span><span class="p">,</span> <span class="s2">&quot;Canada&quot;</span><span class="p">,</span> <span class="s2">&quot;Cape Verde&quot;</span><span class="p">,</span> <span class="s2">&quot;Cayman Islands&quot;</span><span class="p">,</span> <span class="s2">&quot;Central African Republic&quot;</span><span class="p">,</span> <span class="s2">&quot;Chad&quot;</span><span class="p">,</span> <span class="s2">&quot;Chile&quot;</span><span class="p">,</span> <span class="s2">&quot;China&quot;</span><span class="p">,</span></div><div class='line' id='LC35'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Christmas Island&quot;</span><span class="p">,</span> <span class="s2">&quot;Cocos (Keeling) Islands&quot;</span><span class="p">,</span> <span class="s2">&quot;Colombia&quot;</span><span class="p">,</span> <span class="s2">&quot;Comoros&quot;</span><span class="p">,</span> <span class="s2">&quot;Congo&quot;</span><span class="p">,</span></div><div class='line' id='LC36'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Congo, the Democratic Republic of the&quot;</span><span class="p">,</span> <span class="s2">&quot;Cook Islands&quot;</span><span class="p">,</span> <span class="s2">&quot;Costa Rica&quot;</span><span class="p">,</span> <span class="s2">&quot;Cote d&#39;Ivoire&quot;</span><span class="p">,</span> <span class="s2">&quot;Croatia&quot;</span><span class="p">,</span> <span class="s2">&quot;Cuba&quot;</span><span class="p">,</span></div><div class='line' id='LC37'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Cyprus&quot;</span><span class="p">,</span> <span class="s2">&quot;Czech Republic&quot;</span><span class="p">,</span> <span class="s2">&quot;Denmark&quot;</span><span class="p">,</span> <span class="s2">&quot;Djibouti&quot;</span><span class="p">,</span> <span class="s2">&quot;Dominica&quot;</span><span class="p">,</span> <span class="s2">&quot;Dominican Republic&quot;</span><span class="p">,</span> <span class="s2">&quot;Ecuador&quot;</span><span class="p">,</span> <span class="s2">&quot;Egypt&quot;</span><span class="p">,</span></div><div class='line' id='LC38'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;El Salvador&quot;</span><span class="p">,</span> <span class="s2">&quot;Equatorial Guinea&quot;</span><span class="p">,</span> <span class="s2">&quot;Eritrea&quot;</span><span class="p">,</span> <span class="s2">&quot;Estonia&quot;</span><span class="p">,</span> <span class="s2">&quot;Ethiopia&quot;</span><span class="p">,</span> <span class="s2">&quot;Falkland Islands (Malvinas)&quot;</span><span class="p">,</span></div><div class='line' id='LC39'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Faroe Islands&quot;</span><span class="p">,</span> <span class="s2">&quot;Fiji&quot;</span><span class="p">,</span> <span class="s2">&quot;Finland&quot;</span><span class="p">,</span> <span class="s2">&quot;France&quot;</span><span class="p">,</span> <span class="s2">&quot;French Guiana&quot;</span><span class="p">,</span> <span class="s2">&quot;French Polynesia&quot;</span><span class="p">,</span></div><div class='line' id='LC40'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;French Southern Territories&quot;</span><span class="p">,</span> <span class="s2">&quot;Gabon&quot;</span><span class="p">,</span> <span class="s2">&quot;Gambia&quot;</span><span class="p">,</span> <span class="s2">&quot;Georgia&quot;</span><span class="p">,</span> <span class="s2">&quot;Germany&quot;</span><span class="p">,</span> <span class="s2">&quot;Ghana&quot;</span><span class="p">,</span> <span class="s2">&quot;Gibraltar&quot;</span><span class="p">,</span> <span class="s2">&quot;Greece&quot;</span><span class="p">,</span> <span class="s2">&quot;Greenland&quot;</span><span class="p">,</span> <span class="s2">&quot;Grenada&quot;</span><span class="p">,</span> <span class="s2">&quot;Guadeloupe&quot;</span><span class="p">,</span> <span class="s2">&quot;Guam&quot;</span><span class="p">,</span> <span class="s2">&quot;Guatemala&quot;</span><span class="p">,</span> <span class="s2">&quot;Guernsey&quot;</span><span class="p">,</span> <span class="s2">&quot;Guinea&quot;</span><span class="p">,</span></div><div class='line' id='LC41'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Guinea-Bissau&quot;</span><span class="p">,</span> <span class="s2">&quot;Guyana&quot;</span><span class="p">,</span> <span class="s2">&quot;Haiti&quot;</span><span class="p">,</span> <span class="s2">&quot;Heard and McDonald Islands&quot;</span><span class="p">,</span> <span class="s2">&quot;Holy See (Vatican City State)&quot;</span><span class="p">,</span></div><div class='line' id='LC42'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Honduras&quot;</span><span class="p">,</span> <span class="s2">&quot;Hong Kong&quot;</span><span class="p">,</span> <span class="s2">&quot;Hungary&quot;</span><span class="p">,</span> <span class="s2">&quot;Iceland&quot;</span><span class="p">,</span> <span class="s2">&quot;India&quot;</span><span class="p">,</span> <span class="s2">&quot;Indonesia&quot;</span><span class="p">,</span> <span class="s2">&quot;Iran, Islamic Republic of&quot;</span><span class="p">,</span> <span class="s2">&quot;Iraq&quot;</span><span class="p">,</span></div><div class='line' id='LC43'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Ireland&quot;</span><span class="p">,</span> <span class="s2">&quot;Isle of Man&quot;</span><span class="p">,</span> <span class="s2">&quot;Israel&quot;</span><span class="p">,</span> <span class="s2">&quot;Italy&quot;</span><span class="p">,</span> <span class="s2">&quot;Jamaica&quot;</span><span class="p">,</span> <span class="s2">&quot;Japan&quot;</span><span class="p">,</span> <span class="s2">&quot;Jersey&quot;</span><span class="p">,</span> <span class="s2">&quot;Jordan&quot;</span><span class="p">,</span> <span class="s2">&quot;Kazakhstan&quot;</span><span class="p">,</span> <span class="s2">&quot;Kenya&quot;</span><span class="p">,</span></div><div class='line' id='LC44'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Kiribati&quot;</span><span class="p">,</span> <span class="s2">&quot;Korea, Democratic People&#39;s Republic of&quot;</span><span class="p">,</span> <span class="s2">&quot;Korea, Republic of&quot;</span><span class="p">,</span> <span class="s2">&quot;Kuwait&quot;</span><span class="p">,</span> <span class="s2">&quot;Kyrgyzstan&quot;</span><span class="p">,</span></div><div class='line' id='LC45'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Lao People&#39;s Democratic Republic&quot;</span><span class="p">,</span> <span class="s2">&quot;Latvia&quot;</span><span class="p">,</span> <span class="s2">&quot;Lebanon&quot;</span><span class="p">,</span> <span class="s2">&quot;Lesotho&quot;</span><span class="p">,</span> <span class="s2">&quot;Liberia&quot;</span><span class="p">,</span> <span class="s2">&quot;Libyan Arab Jamahiriya&quot;</span><span class="p">,</span></div><div class='line' id='LC46'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Liechtenstein&quot;</span><span class="p">,</span> <span class="s2">&quot;Lithuania&quot;</span><span class="p">,</span> <span class="s2">&quot;Luxembourg&quot;</span><span class="p">,</span> <span class="s2">&quot;Macao&quot;</span><span class="p">,</span> <span class="s2">&quot;Macedonia, The Former Yugoslav Republic Of&quot;</span><span class="p">,</span></div><div class='line' id='LC47'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Madagascar&quot;</span><span class="p">,</span> <span class="s2">&quot;Malawi&quot;</span><span class="p">,</span> <span class="s2">&quot;Malaysia&quot;</span><span class="p">,</span> <span class="s2">&quot;Maldives&quot;</span><span class="p">,</span> <span class="s2">&quot;Mali&quot;</span><span class="p">,</span> <span class="s2">&quot;Malta&quot;</span><span class="p">,</span> <span class="s2">&quot;Marshall Islands&quot;</span><span class="p">,</span> <span class="s2">&quot;Martinique&quot;</span><span class="p">,</span></div><div class='line' id='LC48'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Mauritania&quot;</span><span class="p">,</span> <span class="s2">&quot;Mauritius&quot;</span><span class="p">,</span> <span class="s2">&quot;Mayotte&quot;</span><span class="p">,</span> <span class="s2">&quot;Mexico&quot;</span><span class="p">,</span> <span class="s2">&quot;Micronesia, Federated States of&quot;</span><span class="p">,</span> <span class="s2">&quot;Moldova, Republic of&quot;</span><span class="p">,</span></div><div class='line' id='LC49'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Monaco&quot;</span><span class="p">,</span> <span class="s2">&quot;Mongolia&quot;</span><span class="p">,</span> <span class="s2">&quot;Montenegro&quot;</span><span class="p">,</span> <span class="s2">&quot;Montserrat&quot;</span><span class="p">,</span> <span class="s2">&quot;Morocco&quot;</span><span class="p">,</span> <span class="s2">&quot;Mozambique&quot;</span><span class="p">,</span> <span class="s2">&quot;Myanmar&quot;</span><span class="p">,</span> <span class="s2">&quot;Namibia&quot;</span><span class="p">,</span> <span class="s2">&quot;Nauru&quot;</span><span class="p">,</span></div><div class='line' id='LC50'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Nepal&quot;</span><span class="p">,</span> <span class="s2">&quot;Netherlands&quot;</span><span class="p">,</span> <span class="s2">&quot;Netherlands Antilles&quot;</span><span class="p">,</span> <span class="s2">&quot;New Caledonia&quot;</span><span class="p">,</span> <span class="s2">&quot;New Zealand&quot;</span><span class="p">,</span> <span class="s2">&quot;Nicaragua&quot;</span><span class="p">,</span> <span class="s2">&quot;Niger&quot;</span><span class="p">,</span></div><div class='line' id='LC51'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Nigeria&quot;</span><span class="p">,</span> <span class="s2">&quot;Niue&quot;</span><span class="p">,</span> <span class="s2">&quot;Norfolk Island&quot;</span><span class="p">,</span> <span class="s2">&quot;Northern Mariana Islands&quot;</span><span class="p">,</span> <span class="s2">&quot;Norway&quot;</span><span class="p">,</span> <span class="s2">&quot;Oman&quot;</span><span class="p">,</span> <span class="s2">&quot;Pakistan&quot;</span><span class="p">,</span> <span class="s2">&quot;Palau&quot;</span><span class="p">,</span></div><div class='line' id='LC52'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Palestinian Territory, Occupied&quot;</span><span class="p">,</span> <span class="s2">&quot;Panama&quot;</span><span class="p">,</span> <span class="s2">&quot;Papua New Guinea&quot;</span><span class="p">,</span> <span class="s2">&quot;Paraguay&quot;</span><span class="p">,</span> <span class="s2">&quot;Peru&quot;</span><span class="p">,</span> <span class="s2">&quot;Philippines&quot;</span><span class="p">,</span></div><div class='line' id='LC53'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Pitcairn&quot;</span><span class="p">,</span> <span class="s2">&quot;Poland&quot;</span><span class="p">,</span> <span class="s2">&quot;Portugal&quot;</span><span class="p">,</span> <span class="s2">&quot;Puerto Rico&quot;</span><span class="p">,</span> <span class="s2">&quot;Qatar&quot;</span><span class="p">,</span> <span class="s2">&quot;Reunion&quot;</span><span class="p">,</span> <span class="s2">&quot;Romania&quot;</span><span class="p">,</span> <span class="s2">&quot;Russian Federation&quot;</span><span class="p">,</span></div><div class='line' id='LC54'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Rwanda&quot;</span><span class="p">,</span> <span class="s2">&quot;Saint Barthelemy&quot;</span><span class="p">,</span> <span class="s2">&quot;Saint Helena&quot;</span><span class="p">,</span> <span class="s2">&quot;Saint Kitts and Nevis&quot;</span><span class="p">,</span> <span class="s2">&quot;Saint Lucia&quot;</span><span class="p">,</span></div><div class='line' id='LC55'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Saint Pierre and Miquelon&quot;</span><span class="p">,</span> <span class="s2">&quot;Saint Vincent and the Grenadines&quot;</span><span class="p">,</span> <span class="s2">&quot;Samoa&quot;</span><span class="p">,</span> <span class="s2">&quot;San Marino&quot;</span><span class="p">,</span></div><div class='line' id='LC56'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Sao Tome and Principe&quot;</span><span class="p">,</span> <span class="s2">&quot;Saudi Arabia&quot;</span><span class="p">,</span> <span class="s2">&quot;Senegal&quot;</span><span class="p">,</span> <span class="s2">&quot;Serbia&quot;</span><span class="p">,</span> <span class="s2">&quot;Seychelles&quot;</span><span class="p">,</span> <span class="s2">&quot;Sierra Leone&quot;</span><span class="p">,</span> <span class="s2">&quot;Singapore&quot;</span><span class="p">,</span></div><div class='line' id='LC57'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Slovakia&quot;</span><span class="p">,</span> <span class="s2">&quot;Slovenia&quot;</span><span class="p">,</span> <span class="s2">&quot;Solomon Islands&quot;</span><span class="p">,</span> <span class="s2">&quot;Somalia&quot;</span><span class="p">,</span> <span class="s2">&quot;South Africa&quot;</span><span class="p">,</span></div><div class='line' id='LC58'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;South Georgia and the South Sandwich Islands&quot;</span><span class="p">,</span> <span class="s2">&quot;Spain&quot;</span><span class="p">,</span> <span class="s2">&quot;Sri Lanka&quot;</span><span class="p">,</span> <span class="s2">&quot;Sudan&quot;</span><span class="p">,</span> <span class="s2">&quot;Suriname&quot;</span><span class="p">,</span></div><div class='line' id='LC59'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Svalbard and Jan Mayen&quot;</span><span class="p">,</span> <span class="s2">&quot;Swaziland&quot;</span><span class="p">,</span> <span class="s2">&quot;Sweden&quot;</span><span class="p">,</span> <span class="s2">&quot;Switzerland&quot;</span><span class="p">,</span> <span class="s2">&quot;Syrian Arab Republic&quot;</span><span class="p">,</span></div><div class='line' id='LC60'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Taiwan&quot;</span><span class="p">,</span> <span class="s2">&quot;Tajikistan&quot;</span><span class="p">,</span> <span class="s2">&quot;Tanzania, United Republic of&quot;</span><span class="p">,</span> <span class="s2">&quot;Thailand&quot;</span><span class="p">,</span> <span class="s2">&quot;Timor-Leste&quot;</span><span class="p">,</span></div><div class='line' id='LC61'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Togo&quot;</span><span class="p">,</span> <span class="s2">&quot;Tokelau&quot;</span><span class="p">,</span> <span class="s2">&quot;Tonga&quot;</span><span class="p">,</span> <span class="s2">&quot;Trinidad and Tobago&quot;</span><span class="p">,</span> <span class="s2">&quot;Tunisia&quot;</span><span class="p">,</span> <span class="s2">&quot;Turkey&quot;</span><span class="p">,</span> <span class="s2">&quot;Turkmenistan&quot;</span><span class="p">,</span></div><div class='line' id='LC62'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Turks and Caicos Islands&quot;</span><span class="p">,</span> <span class="s2">&quot;Tuvalu&quot;</span><span class="p">,</span> <span class="s2">&quot;Uganda&quot;</span><span class="p">,</span> <span class="s2">&quot;Ukraine&quot;</span><span class="p">,</span> <span class="s2">&quot;United Arab Emirates&quot;</span><span class="p">,</span> <span class="s2">&quot;United Kingdom&quot;</span><span class="p">,</span></div><div class='line' id='LC63'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;United States&quot;</span><span class="p">,</span> <span class="s2">&quot;United States Minor Outlying Islands&quot;</span><span class="p">,</span> <span class="s2">&quot;Uruguay&quot;</span><span class="p">,</span> <span class="s2">&quot;Uzbekistan&quot;</span><span class="p">,</span> <span class="s2">&quot;Vanuatu&quot;</span><span class="p">,</span> <span class="s2">&quot;Venezuela&quot;</span><span class="p">,</span></div><div class='line' id='LC64'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Viet Nam&quot;</span><span class="p">,</span> <span class="s2">&quot;Virgin Islands, British&quot;</span><span class="p">,</span> <span class="s2">&quot;Virgin Islands, U.S.&quot;</span><span class="p">,</span> <span class="s2">&quot;Wallis and Futuna&quot;</span><span class="p">,</span> <span class="s2">&quot;Western Sahara&quot;</span><span class="p">,</span></div><div class='line' id='LC65'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Yemen&quot;</span><span class="p">,</span> <span class="s2">&quot;Zambia&quot;</span><span class="p">,</span> <span class="s2">&quot;Zimbabwe&quot;</span><span class="o">]</span> <span class="k">unless</span> <span class="nb">const_defined?</span><span class="p">(</span><span class="s2">&quot;COUNTRIES&quot;</span><span class="p">)</span></div><div class='line' id='LC66'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC67'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC68'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">class</span> <span class="nc">InstanceTag</span></div><div class='line' id='LC69'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">to_country_select_tag</span><span class="p">(</span><span class="n">priority_countries</span><span class="p">,</span> <span class="n">options</span><span class="p">,</span> <span class="n">html_options</span><span class="p">)</span></div><div class='line' id='LC70'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">html_options</span> <span class="o">=</span> <span class="n">html_options</span><span class="o">.</span><span class="n">stringify_keys</span></div><div class='line' id='LC71'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">add_default_name_and_id</span><span class="p">(</span><span class="n">html_options</span><span class="p">)</span></div><div class='line' id='LC72'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">value</span> <span class="o">=</span> <span class="n">value</span><span class="p">(</span><span class="n">object</span><span class="p">)</span></div><div class='line' id='LC73'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">content_tag</span><span class="p">(</span><span class="s2">&quot;select&quot;</span><span class="p">,</span></div><div class='line' id='LC74'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">add_options</span><span class="p">(</span></div><div class='line' id='LC75'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">country_options_for_select</span><span class="p">(</span><span class="n">value</span><span class="p">,</span> <span class="n">priority_countries</span><span class="p">),</span></div><div class='line' id='LC76'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">options</span><span class="p">,</span> <span class="n">value</span></div><div class='line' id='LC77'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">),</span> <span class="n">html_options</span></div><div class='line' id='LC78'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">)</span></div><div class='line' id='LC79'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC80'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC81'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC82'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">class</span> <span class="nc">FormBuilder</span></div><div class='line' id='LC83'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">country_select</span><span class="p">(</span><span class="nb">method</span><span class="p">,</span> <span class="n">priority_countries</span> <span class="o">=</span> <span class="kp">nil</span><span class="p">,</span> <span class="n">options</span> <span class="o">=</span> <span class="p">{},</span> <span class="n">html_options</span> <span class="o">=</span> <span class="p">{})</span></div><div class='line' id='LC84'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@template</span><span class="o">.</span><span class="n">country_select</span><span class="p">(</span><span class="vi">@object_name</span><span class="p">,</span> <span class="nb">method</span><span class="p">,</span> <span class="n">priority_countries</span><span class="p">,</span> <span class="n">options</span><span class="o">.</span><span class="n">merge</span><span class="p">(</span><span class="ss">:object</span> <span class="o">=&gt;</span> <span class="vi">@object</span><span class="p">),</span> <span class="n">html_options</span><span class="p">)</span></div><div class='line' id='LC85'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC86'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC87'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC88'><span class="k">end</span></div></pre></div>
          </td>
        </tr>
      </table>
  </div>

          </div>
        </div>

        <a href="#jump-to-line" rel="facebox" data-hotkey="l" class="js-jump-to-line" style="display:none">Jump to Line</a>
        <div id="jump-to-line" style="display:none">
          <h2>Jump to Line</h2>
          <form accept-charset="UTF-8" class="js-jump-to-line-form">
            <input class="textfield js-jump-to-line-field" type="text">
            <div class="full-button">
              <button type="submit" class="button">Go</button>
            </div>
          </form>
        </div>

      </div>
    </div>
</div>

<div id="js-frame-loading-template" class="frame frame-loading large-loading-area" style="display:none;">
  <img class="js-frame-loading-spinner" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-128.gif?1347543527" height="64" width="64">
</div>


        </div>
      </div>
      <div class="context-overlay"></div>
    </div>

      <div id="footer-push"></div><!-- hack for sticky footer -->
    </div><!-- end of wrapper - hack for sticky footer -->

      <!-- footer -->
      <div id="footer">
  <div class="container clearfix">

      <dl class="footer_nav">
        <dt>GitHub</dt>
        <dd><a href="https://github.com/about">About us</a></dd>
        <dd><a href="https://github.com/blog">Blog</a></dd>
        <dd><a href="https://github.com/contact">Contact &amp; support</a></dd>
        <dd><a href="http://enterprise.github.com/">GitHub Enterprise</a></dd>
        <dd><a href="http://status.github.com/">Site status</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>Applications</dt>
        <dd><a href="http://mac.github.com/">GitHub for Mac</a></dd>
        <dd><a href="http://windows.github.com/">GitHub for Windows</a></dd>
        <dd><a href="http://eclipse.github.com/">GitHub for Eclipse</a></dd>
        <dd><a href="http://mobile.github.com/">GitHub mobile apps</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>Services</dt>
        <dd><a href="http://get.gaug.es/">Gauges: Web analytics</a></dd>
        <dd><a href="http://speakerdeck.com">Speaker Deck: Presentations</a></dd>
        <dd><a href="https://gist.github.com">Gist: Code snippets</a></dd>
        <dd><a href="http://jobs.github.com/">Job board</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>Documentation</dt>
        <dd><a href="http://help.github.com/">GitHub Help</a></dd>
        <dd><a href="http://developer.github.com/">Developer API</a></dd>
        <dd><a href="http://github.github.com/github-flavored-markdown/">GitHub Flavored Markdown</a></dd>
        <dd><a href="http://pages.github.com/">GitHub Pages</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>More</dt>
        <dd><a href="http://training.github.com/">Training</a></dd>
        <dd><a href="https://github.com/edu">Students &amp; teachers</a></dd>
        <dd><a href="http://shop.github.com">The Shop</a></dd>
        <dd><a href="/plans">Plans &amp; pricing</a></dd>
        <dd><a href="http://octodex.github.com/">The Octodex</a></dd>
      </dl>

      <hr class="footer-divider">


    <p class="right">&copy; 2013 <span title="0.08141s from fe16.rs.github.com">GitHub</span> Inc. All rights reserved.</p>
    <a class="left" href="https://github.com/">
      <span class="mega-icon mega-icon-invertocat"></span>
    </a>
    <ul id="legal">
        <li><a href="https://github.com/site/terms">Terms of Service</a></li>
        <li><a href="https://github.com/site/privacy">Privacy</a></li>
        <li><a href="https://github.com/security">Security</a></li>
    </ul>

  </div><!-- /.container -->

</div><!-- /.#footer -->


    

    

<div id="keyboard_shortcuts_pane" class="instapaper_ignore readability-extra" style="display:none">
  <h2>Keyboard Shortcuts <small><a href="#" class="js-see-all-keyboard-shortcuts">(see all)</a></small></h2>

  <div class="columns threecols">
    <div class="column first">
      <h3>Site wide shortcuts</h3>
      <dl class="keyboard-mappings">
        <dt>s</dt>
        <dd>Focus command bar</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>?</dt>
        <dd>Bring up this help dialog</dd>
      </dl>
    </div><!-- /.column.first -->

    <div class="column middle" style='display:none'>
      <h3>Commit list</h3>
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selection down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selection up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>c <em>or</em> o <em>or</em> enter</dt>
        <dd>Open commit</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>y</dt>
        <dd>Expand URL to its canonical form</dd>
      </dl>
    </div><!-- /.column.first -->

    <div class="column last js-hidden-pane" style='display:none'>
      <h3>Pull request list</h3>
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selection down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selection up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>o <em>or</em> enter</dt>
        <dd>Open issue</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt><span class="platform-mac">⌘</span><span class="platform-other">ctrl</span> <em>+</em> enter</dt>
        <dd>Submit comment</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt><span class="platform-mac">⌘</span><span class="platform-other">ctrl</span> <em>+</em> shift p</dt>
        <dd>Preview comment</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt><span class="platform-mac">⌘</span><span class="platform-other">ctrl</span> <em>+</em> shift l</dt>
        <dd>Go fullscreen</dd>
      </dl>
    </div><!-- /.columns.last -->

  </div><!-- /.columns.equacols -->

  <div class="js-hidden-pane" style='display:none'>
    <div class="rule"></div>

    <h3>Issues</h3>

    <div class="columns threecols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt>j</dt>
          <dd>Move selection down</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>k</dt>
          <dd>Move selection up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>x</dt>
          <dd>Toggle selection</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>o <em>or</em> enter</dt>
          <dd>Open issue</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="platform-mac">⌘</span><span class="platform-other">ctrl</span> <em>+</em> enter</dt>
          <dd>Submit comment</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="platform-mac">⌘</span><span class="platform-other">ctrl</span> <em>+</em> shift p</dt>
          <dd>Preview comment</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="platform-mac">⌘</span><span class="platform-other">ctrl</span> <em>+</em> shift l</dt>
          <dd>Go fullscreen</dd>
        </dl>
      </div><!-- /.column.first -->
      <div class="column last">
        <dl class="keyboard-mappings">
          <dt>c</dt>
          <dd>Create issue</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>l</dt>
          <dd>Create label</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>i</dt>
          <dd>Back to inbox</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>u</dt>
          <dd>Back to issues</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>/</dt>
          <dd>Focus issues search</dd>
        </dl>
      </div>
    </div>
  </div>

  <div class="js-hidden-pane" style='display:none'>
    <div class="rule"></div>

    <h3>Issues Dashboard</h3>

    <div class="columns threecols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt>j</dt>
          <dd>Move selection down</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>k</dt>
          <dd>Move selection up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>o <em>or</em> enter</dt>
          <dd>Open issue</dd>
        </dl>
      </div><!-- /.column.first -->
    </div>
  </div>

  <div class="js-hidden-pane" style='display:none'>
    <div class="rule"></div>

    <h3>Network Graph</h3>
    <div class="columns equacols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt><span class="badmono">←</span> <em>or</em> h</dt>
          <dd>Scroll left</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">→</span> <em>or</em> l</dt>
          <dd>Scroll right</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">↑</span> <em>or</em> k</dt>
          <dd>Scroll up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">↓</span> <em>or</em> j</dt>
          <dd>Scroll down</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>t</dt>
          <dd>Toggle visibility of head labels</dd>
        </dl>
      </div><!-- /.column.first -->
      <div class="column last">
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">←</span> <em>or</em> shift h</dt>
          <dd>Scroll all the way left</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">→</span> <em>or</em> shift l</dt>
          <dd>Scroll all the way right</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">↑</span> <em>or</em> shift k</dt>
          <dd>Scroll all the way up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">↓</span> <em>or</em> shift j</dt>
          <dd>Scroll all the way down</dd>
        </dl>
      </div><!-- /.column.last -->
    </div>
  </div>

  <div class="js-hidden-pane" >
    <div class="rule"></div>
    <div class="columns threecols">
      <div class="column first js-hidden-pane" >
        <h3>Source Code Browsing</h3>
        <dl class="keyboard-mappings">
          <dt>t</dt>
          <dd>Activates the file finder</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>l</dt>
          <dd>Jump to line</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>w</dt>
          <dd>Switch branch/tag</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>y</dt>
          <dd>Expand URL to its canonical form</dd>
        </dl>
      </div>
    </div>
  </div>

  <div class="js-hidden-pane" style='display:none'>
    <div class="rule"></div>
    <div class="columns threecols">
      <div class="column first">
        <h3>Browsing Commits</h3>
        <dl class="keyboard-mappings">
          <dt><span class="platform-mac">⌘</span><span class="platform-other">ctrl</span> <em>+</em> enter</dt>
          <dd>Submit comment</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>escape</dt>
          <dd>Close form</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>p</dt>
          <dd>Parent commit</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>o</dt>
          <dd>Other parent commit</dd>
        </dl>
      </div>
    </div>
  </div>

  <div class="js-hidden-pane" style='display:none'>
    <div class="rule"></div>
    <h3>Notifications</h3>

    <div class="columns threecols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt>j</dt>
          <dd>Move selection down</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>k</dt>
          <dd>Move selection up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>o <em>or</em> enter</dt>
          <dd>Open notification</dd>
        </dl>
      </div><!-- /.column.first -->

      <div class="column second">
        <dl class="keyboard-mappings">
          <dt>e <em>or</em> shift i <em>or</em> y</dt>
          <dd>Mark as read</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift m</dt>
          <dd>Mute thread</dd>
        </dl>
      </div><!-- /.column.first -->
    </div>
  </div>

</div>

    <div id="markdown-help" class="instapaper_ignore readability-extra">
  <h2>Markdown Cheat Sheet</h2>

  <div class="cheatsheet-content">

  <div class="mod">
    <div class="col">
      <h3>Format Text</h3>
      <p>Headers</p>
      <pre>
# This is an &lt;h1&gt; tag
## This is an &lt;h2&gt; tag
###### This is an &lt;h6&gt; tag</pre>
     <p>Text styles</p>
     <pre>
*This text will be italic*
_This will also be italic_
**This text will be bold**
__This will also be bold__

*You **can** combine them*
</pre>
    </div>
    <div class="col">
      <h3>Lists</h3>
      <p>Unordered</p>
      <pre>
* Item 1
* Item 2
  * Item 2a
  * Item 2b</pre>
     <p>Ordered</p>
     <pre>
1. Item 1
2. Item 2
3. Item 3
   * Item 3a
   * Item 3b</pre>
    </div>
    <div class="col">
      <h3>Miscellaneous</h3>
      <p>Images</p>
      <pre>
![GitHub Logo](/images/logo.png)
Format: ![Alt Text](url)
</pre>
     <p>Links</p>
     <pre>
http://github.com - automatic!
[GitHub](http://github.com)</pre>
<p>Blockquotes</p>
     <pre>
As Kanye West said:

> We're living the future so
> the present is our past.
</pre>
    </div>
  </div>
  <div class="rule"></div>

  <h3>Code Examples in Markdown</h3>
  <div class="col">
      <p>Syntax highlighting with <a href="http://github.github.com/github-flavored-markdown/" title="GitHub Flavored Markdown" target="_blank">GFM</a></p>
      <pre>
```javascript
function fancyAlert(arg) {
  if(arg) {
    $.facebox({div:'#foo'})
  }
}
```</pre>
    </div>
    <div class="col">
      <p>Or, indent your code 4 spaces</p>
      <pre>
Here is a Python code example
without syntax highlighting:

    def foo:
      if not bar:
        return true</pre>
    </div>
    <div class="col">
      <p>Inline code for comments</p>
      <pre>
I think you should use an
`&lt;addr&gt;` element here instead.</pre>
    </div>
  </div>

  </div>
</div>


    <div id="ajax-error-message" class="flash flash-error">
      <span class="mini-icon mini-icon-exclamation"></span>
      Something went wrong with that request. Please try again.
      <a href="#" class="mini-icon mini-icon-remove-close ajax-error-dismiss"></a>
    </div>

    
    
    <span id='server_response_time' data-time='0.08271' data-host='fe16'></span>
    
  </body>
</html>

