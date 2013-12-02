{include file='header.tpl'}

    <div class="main" id="main">
        <div class="main-precontents" id="main-precontents"></div>
        <div class="main-contents" id="main-contents">

{if !empty($announcements)}
    {foreach from=$announcements item=item}
        {include file='bricks/announcement.tpl' an=$item}
    {/foreach}
{/if}

            <script type="text/javascript">//<![CDATA[
{include file='bricks/community.tpl'}
                var g_pageInfo = {ldelim}type: {$page.type}, typeId: {$page.typeId}, name: '{$lvData.page.name|escape:"quotes"}'{rdelim};
                g_initPath({$page.path});
            //]]></script>

{include file='bricks/infobox.tpl' info=$lvData.infobox}

            <div class="text">
                <div id="race-icon-male" class="h1-icon"></div>
                <div id="race-icon-female" class="h1-icon"></div>
                <script type="text/javascript">
                    $WH.ge('race-icon-male').appendChild(Icon.create('race_{$lvData.page.icon}_male', 1));
                    $WH.ge('race-icon-female').appendChild(Icon.create('race_{$lvData.page.icon}_female', 1));
                </script>

                <a href="{$wowhead}" class="button-red"><em><b><i>Wowhead</i></b><span>Wowhead</span></em></a>
                <a href="javascript:;" id="open-links-button" class="button-red" onclick="this.blur(); Links.show({ldelim} type: {$page.type}, typeId: {$page.typeId} {rdelim});"><em><b><i>{$lang.links}</i></b><span>{$lang.links}</span></em></a>
                <h1 class="h1-icon">{if $lvData.page.expansion}<span class="{$lvData.page.expansion}-icon-right">{$lvData.page.name}</span>{else}{$lvData.page.name}{/if}</h1>

{include file='bricks/article.tpl'}

                <h2 class="clear">{$lang.related}</h2>
            </div>

{include file='bricks/tabsRelated.tpl' tabs=$lvData.relTabs}

{include file='bricks/contribute.tpl'}

        </div><!-- main-contents -->
    </div><!-- main -->

{include file='footer.tpl'}