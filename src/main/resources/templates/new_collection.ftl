<#import "parts/common.ftl" as c>
<@c.page>

    <div style="text-align: center;"><h1>Новый набор</h1></div>

    <div>
        <form method="post"  action="/new/report">
            <div class="form-outline mb-4">
                <label class="form-label" for="form4Example1">Набор</label>
                <select name="table" class="custom-select mb-2">
                    <option selected="selected">Номер набора</option>
                    <option>Первый</option>
                    <option>Второй</option>
                    <option>Третий</option>
                    <option>Четвертый</option>
                    <option>Пятый</option>
                </select>
            </div>

            <div class="form-outline mb-4">
                <label class="form-label" for="form4Example2">Блюдо</label>
                <select name="nameDish" class="custom-select mb-2">
                    <option selected="selected">Выберите блюдо</option>
                    <#if Dishes??>
                        <#list Dishes as Dishes>
                            <option>${Dishes.getNameDish()}</option>
                        </#list>
                    </#if>
                </select>
            </div>

            <div class="form-outline mb-4">
                <label class="form-label" for="form4Example3">Кол-во порций</label>
                <input type="number" class="form-control" name="count"
                       placeholder="Кол-во порций"/>
            </div>

            <!-- Submit button -->
            <button type="submit" class="btn btn-primary btn-block mb-4">Добавить</button>
        </form>
    </div>

</@c.page>


