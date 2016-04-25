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

-->
  <tr>
    <td>{$date}</td>
    <td>{$contribution.total_amount}</td>
    <td>{$contribution.source}</td>
  </tr>
  <!--
{/foreach}
-->
  <tr>
    <td><strong>Total</strong></td>
    <td><strong>{$contact_aggregate}</strong></td>
    <td></td>
  </tr>
  </tbody>
</table>
