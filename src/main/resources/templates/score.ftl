<#import "parts/common.ftl" as c>
<@c.page>

    <style>
        table, td, th {
            border: 1px solid #999;
            padding: 5px;
        }
    </style>

<div class="jumbotron vertical-center">

<div class="container">


<div class="form-group mt-3">
            <form  class="form-inline" method="post" enctype="multipart/form-data" action="/score">
                <div>
                    <select name="table" class="custom-select">
                        <option selected="selected">Номер набора</option>
                        <option>Первый</option>
                        <option>Второй</option>
                        <option>Третий</option>
                        <option>Четвертый</option>
                        <option>Пятый</option>
                    </select>
                </div>
                <div class="form-group">
                    <button type="submit">Распечатать</button>
                </div>
            </form>
        </div>


    <div style="text-align: center;"><h1>Счет</h1></div>

    <div>
        <br/>
    </div>

    <#if date??>
        <div>
            <br/>
            <span>Дата : ${date}</span>
            <br/>
        </div>
    <#else>
        No message
    </#if>

    <#if time??>
        <div>
            <br/>
            <span>Время : ${time}</span>
            <br/>
        </div>
    <#else>
        No message
    </#if>

    <div>
        <br/>
    </div>

    <table>
        <thead>
        <tr>
            <th>Блюдо</th>
            <th>Кол-во</th>
            <th>Цена</th>
            <th>Сумма</th>
        </tr>
        </thead>
        <tbody>
        <#if Reports??>
            <#list Reports as Reports>
                <tr>
                    <td> ${Reports.getDish().getNameDish()}</td>
                    <td> ${Reports.getCount()}</td>
                    <td> ${Reports.getPrice()}</td>
                    <td> ${Reports.getSum()}</td>
                </tr>
            <#else>
                No message
            </#list>
        </#if>
        </tbody>
    </table>

    <#if overall1??>
        <div>
            <br/>
            <span>Итого к оплате: ${overall1.getOverallSum()}</span>
            <br/>
        </div>
    <#else>
        No message
    </#if>

    <div>
        <br/>
    </div>

    <#if ingredients??>
        <#list ingredients as ingredients>
            <div>
                <br/>
                <span>Ингредиент   :  ${ingredients.getName()}</span>
                <span>Кол-во :  ${ingredients.getCount()}</span>
                <br/>
            </div>
        <#else>
            No message
        </#list>
    </#if>

    <#if overall1??>
        <div>
            <br/>
            <span>Себестоимость : ${overall1.getOverallIngSum()}</span>
            <br/>
        </div>
    <#else>
        No message
    </#if>

</div>
</div>
</@c.page>


