{crmAPI var='result' entity='Contribution'; action='get' contact_id=$messageContactID
receive_date=$em_this_year_clause
}
{assign var='contributions' value=$result.values}
{assign var='contact_aggregate' value=0}
<table align='left' border='1' cellpadding='2' cellspacing='0' class='table' style='width: 500px;'>
  <tbody>
  <tr>
    <th>Date</th>
    <th>Amount</th>
    <th>Source</th>
  </tr>
  <!--
{foreach from=$contributions item=contribution}
 {assign var='date' value=$contribution.receive_date|date_format:'%d %B %Y'}
  {assign var=contact_aggregate value=$contact_aggregate+$contribution.total_amount}
-->
  <tr>
    <td>{$date}</td>
    <td>{$contribution.total_amount|crmMoney}</td>
    <td>{$contribution.contribution_source}</td>
  </tr>
  <!--
{/foreach}

-->
  <tr>
    <td><strong>Total</strong></td>
    <td><strong>{$contact_aggregate|crmMoney}</strong></td>
    <td></td>
  </tr>
  </tbody>
</table>

