
[{include file="headitem.tpl" title="COMPLIANCECOOKIES_LIST_TITLE"|oxmultilangassign box="list"}]
[{assign var="where" value=$oView->getListFilter()}]

[{if $readonly}]
    [{assign var="readonly" value="readonly disabled"}]
    [{else}]
    [{assign var="readonly" value=""}]
    [{/if}]

<script type="text/javascript">
  <!--
  window.onload = function ()
  {
    top.reloadEditFrame();
    [{if $updatelist == 1}]
    top.oxid.admin.updateList('[{$oxid}]');
    [{/if}]
  }
  //-->
</script>

<div id="liste">
    <form name="search" id="search" action="[{$oViewConf->getSelfLink()}]" method="post">
        [{include file="_formparams.tpl" cl="compliancecookies_list" lstrt=$lstrt actedit=$actedit oxid=$oxid fnc="" language=$actlang editlanguage=$actlang}]
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <colgroup>
                [{block name="admin_compliancecookie_list_colgroup"}]
            <col width="3%">
            <col width="27%">
            <col width="29%">
            <col width="29%">
                [{/block}]
            </colgroup>
            <tr class="listfilter">
                [{block name="admin_compliancecookie_list_filter"}]
                <td valign="top" class="listfilter first" align="right">
                    <div class="r1"><div class="b1">&nbsp;</div></div>
                </td>
                <td valign="top" class="listfilter" height="20">
                    <div class="r1"><div class="b1">&nbsp;</div></div>
                </td>
                <td valign="top" class="listfilter" height="20">
                    <div class="r1"><div class="b1">
                            <input class="listedit" type="text" size="20" maxlength="128" name="where[compliancecookies][oxcookie]" value="[{$where.compliancecookies.oxcookie}]" [{$readonly}]>
                        </div></div>
                </td>
                <td valign="top" class="listfilter" height="20">
                    <div class="r1"><div class="b1">
                            <input class="listedit" type="text" size="20" maxlength="128" name="where[compliancecookies][oxtitle]" value="[{$where.compliancecookies.oxtitle}]" [{$readonly}]>
                        </div></div>
                </td>
                <td valign="top" class="listfilter">
                    <div class="r1"><div class="b1">
                            <div class="find">
                                <select name="changelang" class="editinput" onChange="Javascript:top.oxid.admin.changeLanguage();">
                                    [{foreach from=$languages item=lang}]
                                    <option value="[{$lang->id}]" [{if $lang->selected}]SELECTED[{/if}]>[{$lang->name}]</option>
                                    [{/foreach}]
                                </select>
                                <input class="listedit" type="submit" name="submitit" value="[{oxmultilang ident="GENERAL_SEARCH"}]" [{$readonly}]>
                            </div>
                        </div></div>
                </td>
                [{/block}]
            </tr>
            <tr>
                [{block name="admin_compliancecookie_list_sorting"}]
                <td class="listheader first" height="15" width="30" align="center"><a href="Javascript:top.oxid.admin.setSorting( document.search, 'compliancecookies', 'oxactive', 'asc');document.search.submit();" class="listheader">[{oxmultilang ident="GENERAL_ACTIVTITLE"}]</a></td>
                <td class="listheader" height="15">&nbsp;<a href="Javascript:top.oxid.admin.setSorting( document.search, 'compliancecookies', 'oxcategory', 'asc');document.search.submit();" class="listheader">[{oxmultilang ident="GENERAL_CATEGORY"}]</a></td>
                <td class="listheader"><a href="Javascript:top.oxid.admin.setSorting( document.search, 'compliancecookies', 'oxcookie', 'asc');document.search.submit();" class="listheader">[{oxmultilang ident="GENERAL_IDENT"}]</a></td>
                <td class="listheader" colspan="2"><a href="Javascript:top.oxid.admin.setSorting( document.search, 'compliancecookies', 'oxtitle', 'asc');document.search.submit();" class="listheader">[{oxmultilang ident="GENERAL_NAME"}]</a></td>
                [{/block}]
            </tr>

            [{assign var="blWhite" value=""}]
            [{assign var="_cnt" value=0}]
            [{foreach from=$mylist item=listitem}]
            [{assign var=complianceCategory value=$listitem->compliancecookies__oxcategory->value}]
            [{assign var="_cnt" value=$_cnt+1}]
            <tr id="row.[{$_cnt}]">
                [{block name="admin_compliancecookie_list_item"}]
                [{if $listitem->blacklist == 1}]
                [{assign var="listclass" value=listitem3}]
                [{else}]
                [{assign var="listclass" value=listitem$blWhite}]
                [{/if}]
                [{if $listitem->getId() == $oxid}]
                [{assign var="listclass" value=listitem4}]
                [{/if}]
                <td valign="top" class="[{$listclass}][{if $listitem->compliancecookies__oxactive->value == 1}] active[{/if}]" height="15"><div class="listitemfloating">&nbsp</a></div></td>
                <td valign="top" class="[{$listclass}]" height="15"><div class="listitemfloating">&nbsp;<a href="Javascript:top.oxid.admin.editThis('[{$listitem->compliancecookies__oxid->value}]');" class="[{$listclass}]">[{oxmultilang ident="COOKIE_COMPLIANCE_CATEGORY_"|cat:$complianceCategory}]</a></div></td>
                <td valign="top" class="[{$listclass}]"><div class="listitemfloating"><a href="Javascript:top.oxid.admin.editThis('[{$listitem->compliancecookies__oxid->value}]');" class="[{$listclass}]">[{$listitem->compliancecookies__oxcookie->value}]</a></div></td>
                <td valign="top" class="[{$listclass}]"><div class="listitemfloating"><a href="Javascript:top.oxid.admin.editThis('[{$listitem->compliancecookies__oxid->value}]');" class="[{$listclass}]">[{$listitem->compliancecookies__oxtitle->value}]</a></div></td>

                <td class="[{$listclass}]">
                    [{if !$readonly}]
                        <a href="Javascript:top.oxid.admin.deleteThis('[{$listitem->compliancecookies__oxid->value}]');" class="delete" id="del.[{$_cnt}]" title="" [{include file="help.tpl" helpid=item_delete}]></a>
                    [{/if}]
                </td>
                [{/block}]
            </tr>
            [{assign var="blWhite" value="2"}]
            [{if $blWhite == "2"}]
            [{assign var="blWhite" value=""}]
            [{/if}]
            [{/foreach}]
            [{include file="pagenavisnippet.tpl" colspan="5"}]
        </table>
    </form>
</div>

[{include file="pagetabsnippet.tpl"}]

<script type="text/javascript">
  if (parent.parent)
  {   parent.parent.sShopTitle   = "[{$actshopobj->oxshops__oxname->getRawValue()|oxaddslashes}]";
    parent.parent.sMenuItem    = "[{oxmultilang ident="COMPLIANCECOOKIE_LIST_MENUITEM"}]";
    parent.parent.sMenuSubItem = "[{oxmultilang ident="COMPLIANCECOOKIE_LIST_MENUSUBITEM"}]";
    parent.parent.sWorkArea    = "[{$_act}]";
    parent.parent.setTitle();
  }
</script>
</body>
</html>